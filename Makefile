SHADERS = CopyShader.js HorizontalTiltShiftShader.js VerticalTiltShiftShader.js BokehShader.js
POSTPROCESSING = EffectComposer.js ShaderPass.js RenderPass.js MaskPass.js

SHADERS_SOURCE = https://raw.github.com/mrdoob/three.js/master/examples/js/shaders/
SHADERS_PATH = src/examples/js/shaders/
POSTPROCESSING_SOURCE = https://raw.github.com/mrdoob/three.js/master/examples/js/postprocessing/
POSTPROCESSING_PATH = src/examples/js/postprocessing/

shaders: 
	mkdir -p ${SHADERS_PATH}
	rm -fr ${SHADERS_PATH}/*
	for FILE in ${SHADERS}; \
		do curl -s ${SHADERS_SOURCE}/$${FILE} > ${SHADERS_PATH}/$${FILE}; \
	done

postprocessing:
	mkdir -p ${POSTPROCESSING_PATH}
	rm -fr ${POSTPROCESSING_PATH}/*
	for FILE in ${POSTPROCESSING}; \
		do curl -s ${POSTPROCESSING_SOURCE}/$${FILE} > ${POSTPROCESSING_PATH}/$${FILE}; \
	done


update: shaders postprocessing
	echo "THREE = require('three');\n\n" > index.js
	cat ${SHADERS_PATH}/*.js ${POSTPROCESSING_PATH}/*.js >> index.js


build: components
	@component build --dev

components: component.json
	@component install --dev

clean:
	rm -fr build components template.js

.PHONY: clean
