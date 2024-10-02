#!/bin/bash
#https://gist.github.com/MoriTanosuke/1745628
OLDIFS=$IFS
IFS=$'\n'
echo "Starting gallery..."


FILES=$(find . -name '*.png')

# create html page for subdirectory
cat > index.html << EOF
<html>
<head>
</head>
<body>
<h1>$d</h1>
<ul>
EOF

for img in $FILES
  do
    echo "<a name=\"${img/.\//}\" href=\"#${img/.\//}\"><H2>${img/.\//}</H2></a>" >> index.html
    echo "<a style=\"width: 100%;\" href=\"$img\">" >> index.html
      echo "<img style=\"width: 80%; margin: 0 auto; display: block;\" src=\"$img\" />" >> index.html ;
    echo "</a>" >> index.html
  done
  cat >> index.html << EOF
</ul>
</body>
</html>
EOF

IFS=$OLDIFS
echo "Gallery ready."