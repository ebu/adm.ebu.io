# EBU ADM Website

# THIS IS wb's dev branch!

## Overview

This repository hosts the "EBU ADM Website", which contains the EBU's ADM homepate, and other
related pages including the ADM guidelines.

## Generate

If you want to build the guidelines yourself or you want to contribute to this project, follow the instructions below.

### Get the source

```
git clone git@git.ebu.io:as/ebu-adm-io.git
```

### Install requirements

The Guidelines are generated using [MkDocs](http://www.mkdocs.org). The graphs within the document are generated with [graphviz](https://www.graphviz.org).

You might consider using a [virtualenv](https://virtualenv.pypa.io/en/stable/) install the python requirements.

Install the python requirements:

```
pip install -r requirements.txt
```

Install graphviz

On Ubuntu, use
```
sudo apt install graphviz
```

On OSX with [homebrew](http://www.homebrew.sh) use
```
brew install graphviz
```

### Build the site

You can create the HTML version of the site by running
```
mkdocs build
```
in the project folder.

If you want to have a live preview while you're editing, you can use
```
mkdocs serve
```
If you have made any changes to or added some `dot` files run
```
./convert_dot_graphs.sh
```
in the project folder.

For more information and options, please refer to the [mkdocs manual](http://www.mkdocs.org)
