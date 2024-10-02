build: tools/plantuml.jar
	rm -rf generated
	java -jar tools/plantuml.jar -Djava.awt.headless=true -r -v -failfast -nbthread auto "**/*.puml"
	mkdir generated
	#rsync -av  --exclude-from=".gitignore" --include='*/' --include="*.png" --exclude="*" . generated/
	rsync -av  --exclude="generated" --exclude="tools" --exclude=".*" --include='*/' --include="*.png" --exclude="*" . generated/
	cd generated && ./../gallery.sh


tools/plantuml.jar:
	mkdir -p tools
	wget -O tools/plantuml.jar https://github.com/plantuml/plantuml/releases/download/v1.2024.7/plantuml-lgpl-1.2024.7.jar

