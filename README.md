# Lorempixel [![Build Status](https://travis-ci.org/xeraseth/lorempixel_gem.png)](https://travis-ci.org/xeraseth/lorempixel_gem)

_A Ruby gem for downloading placeholder images._

## Project Setup

1. Install Ruby (https://www.ruby-lang.org/en/downloads/)
2. ```gem install lorempixel ```


## Testing

```rspec test/```
or
``` rake ```


## Options

* amount(-a) - Set number of images to create, default: 10
* dir(-d) - Set the directory to put the images in, default: "images"
* prefix(-p) - Set the naming convention for images (alphanumeric and underscore only). This will be appended with a number, default: "image_"
* height(-h) - Set the height(eg 100) or height range (eg 100-500), default: 100-500
* width(-w) - Set the width(eg 100) or width range (eg 100-500), default: 100-500
* help - Get a list of options


## Examples

```sh
lorempixel
```
Generates 10 pictures, with the prefix "image_" ranging from 100-500 pixels tall and wide in an "images" directory of where you ran the command.

```sh
lorempixel --amount 20 --dir placeholder
```
Generates 20 pictures, with the prefix "image_" ranging from 100-500 pixels tall and wide in an "placeholder" directory of where you ran the command.

```sh
lorempixel --help
```
Brings up the list of options


## License
###The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
