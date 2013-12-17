
[component](https://github.com/component/component) export for selected valueAdds from non-core [three.js](https://github.com/mrdoob/three.js)/examples/{shaders,postprocessing}

only included the bits i wanted - see makefile

### install 

```

component install nomilous/three-postprocessing
component build

```

### use, browser-side

```js

// assuming build.js has been loaded
var THREE = require('three'); require('three-postprocessing');


```
