#include <windows.h>
#include <setupapi.h>
#include <stdio.h>
#include <regstr.h>

int main()
{

    HDEVINFO deviceInfoSet = SetupDiGetClassDevs(NULL, "PCI\\VEN_8086&DEV_1502&SUBSYS_20178086&REV_05", NULL, DIGCF_ALLCLASSES);
    if (deviceInfoSet == INVALID_HANDLE_VALUE)
    {
        printf("Failed to get device information set. Error: %lu\n", GetLastError());
        return 1;
    }

    SP_DEVINFO_DATA deviceInfoData;
    deviceInfoData.cbSize = sizeof(SP_DEVINFO_DATA);

    for (DWORD i = 0; SetupDiEnumDeviceInfo(deviceInfoSet, i, &deviceInfoData); i++)
    {
        char deviceName[1024];
        DWORD configFlag = 0;
        ;
        if (SetupDiGetDeviceRegistryProperty(deviceInfoSet, &deviceInfoData, SPDRP_DEVICEDESC, NULL, (PBYTE)deviceName, sizeof(deviceName), NULL) &&
            SetupDiGetDeviceRegistryProperty(deviceInfoSet, &deviceInfoData, SPDRP_CONFIGFLAGS, NULL, (PBYTE)&configFlag, sizeof(configFlag), NULL))
        {
            char *status = configFlag == CONFIGFLAG_DISABLED ? "Disabled" : "Enabled";
            char *match = strcmp(deviceName, "Intel(R) 82579LM Gigabit Network Connection") == 0 ? "Yes" : "No";
            printf("Device: %s, Match: %s, Status: %s\n", deviceName, match, status);

            SP_PROPCHANGE_PARAMS spPropChangeParams;
            spPropChangeParams.ClassInstallHeader.cbSize = sizeof(SP_CLASSINSTALL_HEADER);
            spPropChangeParams.ClassInstallHeader.InstallFunction = DIF_PROPERTYCHANGE;
            spPropChangeParams.Scope = DICS_FLAG_GLOBAL;
            spPropChangeParams.HwProfile = 0;
            spPropChangeParams.StateChange = DICS_DISABLE;

            if (!SetupDiSetClassInstallParams(deviceInfoSet, &deviceInfoData, (SP_CLASSINSTALL_HEADER *)&spPropChangeParams, sizeof(SP_PROPCHANGE_PARAMS)))
            {
                printf("Failed to set class install parameters. Error: %lu\n", GetLastError());
                SetupDiDestroyDeviceInfoList(deviceInfoSet);
                return 1;
            }

            if (!SetupDiChangeState(deviceInfoSet, &deviceInfoData))
            {
                DWORD errorCode = GetLastError();
                char strErrorCode[7];
                snprintf(strErrorCode, sizeof(strErrorCode), "%lu", errorCode);
                char *errorMessage = errorCode == ERROR_ACCESS_DENIED ? "Access is denied." : strErrorCode;

                printf("Failed to change device state. Error: %s\n", errorMessage);
                SetupDiDestroyDeviceInfoList(deviceInfoSet);
                return 1;
            }

            printf("Succeeded in changing device state to Disabled.\n");

            spPropChangeParams.StateChange = DICS_ENABLE;
            if (!SetupDiSetClassInstallParams(deviceInfoSet, &deviceInfoData, (SP_CLASSINSTALL_HEADER *)&spPropChangeParams, sizeof(SP_PROPCHANGE_PARAMS)))
            {
                printf("Failed to set class install parameters. Error: %lu\n", GetLastError());
                SetupDiDestroyDeviceInfoList(deviceInfoSet);
                return 1;
            }

            if (!SetupDiChangeState(deviceInfoSet, &deviceInfoData))
            {
                DWORD errorCode = GetLastError();
                char strErrorCode[7];
                snprintf(strErrorCode, sizeof(strErrorCode), "%lu", errorCode);
                char *errorMessage = errorCode == ERROR_ACCESS_DENIED ? "Access is denied." : strErrorCode;

                printf("Failed to change device state. Error: %s\n", errorMessage);
                SetupDiDestroyDeviceInfoList(deviceInfoSet);
                return 1;
            }
            printf("Succeeded in changing device state to Enabled.\n");
        }
    }

    SetupDiDestroyDeviceInfoList(deviceInfoSet);
    return 0;
}
