#include<stdio.h>
int main()
{
  printf("First C Program\n");
  return 0;
}
```
#!/bin/bash

if [ -z $PROJECT_DIR ]; then
	PROJECT_DIR=$(pwd)
fi

if [ -d $PROJECT_DIR ]; then
	cd $PROJECT_DIR
fi
if [ -z $PROJECT_NAME ]; then
	# read in the project name
	read -p "Project Name: " PROJECT_NAME
else
	PROJECT_NAME=$PROJECT_NAME
fi
if [ -z $GIT_REPO_URL ]; then
	# read in the project repo
	read -p "Git Repository URL: " GIT_REPO_URL
else
	GIT_REPO_URL=$GIT_REPO_URL
fi
if [ -z $GITHUB_TOKEN ]; then
	# read in the project repo
	read -p "GitHub Token: " GITHUB_TOKEN
else
	GITHUB_TOKEN=$GITHUB_TOKEN
fi

echo "Creating project: $PROJECT_NAME"
if [! -d "$PROJECT_NAME" ]; then
	mkdir $PROJECT_NAME
fi
cd $PROJECT_NAME

if [! -f "$PROJECT_NAME.md" ]; then
	echo "Creating description file: $PROJECT_NAME.md"
	echo "# $PROJECT_NAME" >> $PROJECT_NAME.md
fi

if [ -z $DESCRIPTION ]; then
	read -p "Description: " DESCRIPTION
else
	DESCRIPTION=$DESCRIPTION
fi

echo "Setting description: $DESCRIPTION"
sed -i "1s/.*/# $PROJECT_NAME/" $PROJECT_NAME.md

echo "Creating directory: $PROJECT_NAME/README.md"
if [! -f "$PROJECT_NAME/README.md" ]; then
	touch $PROJECT_NAME/README.md
fi

if [ -f "$PROJECT_NAME/README.md" ]; then
	cd $PROJECT_NAME
	if [! -d ".github" ]; then
		git init
		git config user.name ""
		git config user.email ""
		touch.gitignore
	fi
	if [! -d ".github/workflows" ]; then
		mkdir ".github/workflows"
	fi
	cd ".github/workflows"
	if [! -d "create-project.yml" ]; then
		touch create-project.yml
	fi
	if [! -d "create-project.yml" ]; then
		touch create-project.yml
	fi
	if [! -f "create-project.yml" ]; then
		touch create-project.yml
	fi
	if [! -d "create-project.yml" ]; then
		touch create-project.yml
	fi
	cd $PROJECT_DIR
	if [! -d ".github/workflows/create-project.yml" ]; then
		touch ".github/workflows/create-project.yml"
	fi
	if [! -d ".github/workflows/create-project.yml" ]; then
		touch ".github/workflows/create-project.yml"
	fi
	if [! -f ".github/workflows/create-project.yml" ]; then
		touch ".github/workflows/create-project.yml"
	fi
	if [! -d ".github/workflows/create-project.yml" ]; then
		touch ".github/workflows/create-project.yml"
	fi
	echo "Creating workflow file: $PROJECT_NAME/.github/workflows/create-project.yml"
	echo "Creating project: $PROJECT_NAME"
	touch ".github/workflows/create-project.yml"
	echo "name: Create Project" >> ".github/workflows/create-project.yml"
	echo "on: push" >> ".github/workflows/create-project.yml"
	echo "jobs:" >> ".github/workflows/create-project.yml"
	echo "  create-project:" >> ".github/workflows/create-project.yml"
	echo "    runs-on: ubuntu-latest" >> ".github/workflows/create-project.yml"
	echo "    steps:" >> ".github/workflows/create-project.yml"
	echo "      - uses: actions/checkout@v2" >> ".github/workflows/create-project.yml"
	echo "      - uses: actions/setup-node@v1" >> ".github/workflows/create-project.yml"
	echo "      - name: Set up Python 3.7" >> ".github/workflows/create-project.yml"
	echo "        uses: actions/setup-python@v1" >> ".github/workflows/create-project.yml"
	echo "        with:" >> ".github/workflows/create-project.yml"
	echo "          python-version: '3.7'" >> ".github/workflows/create-project.yml"
	echo "      - name: Install Python dependencies" >> ".github/workflows/create-project.yml"
	echo "        run: \"pip install pyperclip\"" >> ".github/workflows/create-project.yml"
	echo "      - name: Install dependencies" >> ".github/workflows/create-project.yml"
	echo "        run: \"npm