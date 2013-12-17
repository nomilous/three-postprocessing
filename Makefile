update: 

	mkdir -p src/examples/js/shaders/
	rm -fr src/examples/js/shaders/*

	curl -s https://raw.github.com/mrdoob/three.js/master/examples/js/shaders/CopyShader.js > src/examples/js/shaders/CopyShader.js

	mkdir -p src/examples/js/postprocessing/
	rm -fr src/examples/js/postprocessing/*

	curl -s https://raw.github.com/mrdoob/three.js/master/examples/js/postprocessing/EffectComposer.js > src/examples/js/postprocessing/EffectComposer.js
	curl -s https://raw.github.com/mrdoob/three.js/master/examples/js/postprocessing/ShaderPass.js > src/examples/js/postprocessing/ShaderPass.js



build: components
	@component build --dev

components: component.json
	@component install --dev

clean:
	rm -fr build components template.js

.PHONY: clean
