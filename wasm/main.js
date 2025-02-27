(async () => {
    console.log('Start');
    const wasmS = await fetch("./main.wasm");
    const text = await wasmS.text();
    console.log(text);
    const wasm = await WebAssembly.instantiateStreaming(fetch("./main.wasm"), { env: {} });
    const main = wasm.instance.exports.main(77);
    console.log("Main77:", main);
    console.log('Done!');
})()