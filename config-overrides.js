/* config-overrides.js */
module.exports = function override(config, env) {
    // Fix for axios and other packages that use Node.js core modules
    config.resolve.fallback = {
        ...config.resolve.fallback,
        "http": false,
        "https": false,
        "stream": false,
        "url": false,
        "util": false,
        "zlib": false,
        "buffer": false,
        "assert": false,
        "crypto": false,
        "os": false,
        "path": false,
        "fs": false,
        "net": false,
        "tls": false,
        "child_process": false
    };
    
    return config;
};
