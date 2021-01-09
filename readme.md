
## Columbia Environmental Engineering grad student website

This is the source for a website of resources maintained by grad
students in Environmental Engineering at Columbia University.

## Contributing

Contributions are welcome!

To contribute:

1. Create a Github account if you do not already have one.
2. Fork the repository.
3. Edit the markdown files (or add new ones) in the `source`
   directory.
4. Submit a pull request to add your changes to the repository.

If any of these steps are new to you, just reach out to Adam (akm2203)
and he'd be happy to help!

## Building the website

### Required software

-   [pandoc](https://pandoc.org/)
-   [GNU Make](https://www.gnu.org/software/make/)


##### GNU/Linux instructions

Clone this repository, enter directory, and run:

``` {.bash}
make
```
This will build the website and deploy it to the directory
`public_html`.

This should also probably work on OSX, but I haven\'t tested it.

##### Windows (unsupported for now- help needed)

Any Windows wizards please reach out - I'd love to have build
instructions for Windows but I don't know how (or if) Make, sh, and
CLI utilities work on Windows.
