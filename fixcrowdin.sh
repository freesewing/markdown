#!/bin/bash

# There's an issue with crowding where it messes up MDX inline components
# This scripts tries to fix as many of those issues as possible in an automated way

# Fix <Note> component
sed -i 's/note>/Note>/' **/*.md
sed -i 's/note>/Note>/' **/**/*.md
sed -i 's/note>/Note>/' **/**/**/*.md
sed -i 's/note>/Note>/' **/**/**/**/*.md
sed -i 's/note>/Note>/' **/**/**/**/**/*.md
sed -i 's/note>/Note>/' **/**/**/**/**/**/*.md
sed -i 's/note>/Note>/' **/**/**/**/**/**/***.md

# Fix <Warning> component
sed -i 's/warning>/Warning>/' **/*.md
sed -i 's/warning>/Warning>/' **/**/*.md
sed -i 's/warning>/Warning>/' **/**/**/*.md
sed -i 's/warning>/Warning>/' **/**/**/**/*.md
sed -i 's/warning>/Warning>/' **/**/**/**/**/*.md
sed -i 's/warning>/Warning>/' **/**/**/**/**/**/*.md
sed -i 's/warning>/Warning>/' **/**/**/**/**/**/***.md

# Fix <Tip> component
sed -i 's/tip>/Tip>/' **/*.md
sed -i 's/tip>/Tip>/' **/**/*.md
sed -i 's/tip>/Tip>/' **/**/**/*.md
sed -i 's/tip>/Tip>/' **/**/**/**/*.md
sed -i 's/tip>/Tip>/' **/**/**/**/**/*.md
sed -i 's/tip>/Tip>/' **/**/**/**/**/**/*.md
sed -i 's/tip>/Tip>/' **/**/**/**/**/**/***.md

# Fix <Example> component
sed -i 's/example>/Example>/' **/*.md
sed -i 's/example>/Example>/' **/**/*.md
sed -i 's/example>/Example>/' **/**/**/*.md
sed -i 's/example>/Example>/' **/**/**/**/*.md
sed -i 's/example>/Example>/' **/**/**/**/**/*.md
sed -i 's/example>/Example>/' **/**/**/**/**/**/*.md
sed -i 's/example>/Example>/' **/**/**/**/**/**/***.md

