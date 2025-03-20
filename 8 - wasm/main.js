(async () => {
    console.log('Start');
    const wasmS = await fetch("./main.wasm");
    const text = await wasmS.text();
    console.log(text);
    let wasm;
    wasm = await WebAssembly.instantiateStreaming(fetch("./main.wasm"), {
        env: {
            print: (...args) => {
                const text = new TextDecoder().decode(new Uint8Array(wasm.instance.exports.memory.buffer, args[0], 1000));
                console.log(new Uint8Array(wasm.instance.exports.memory.buffer, args[2], 10));
                console.log("text:", text, args);
            }
        }
    });
    const main = wasm.instance.exports.main(7777);
    console.log("Main777:", main);
    console.log('Done!');
})()