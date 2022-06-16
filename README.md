![](https://img.shields.io/badge/Microverse-blueviolet)
![](https://img.shields.io/static/v1?label=BY&message=eduardosancho&color=purple)
![](https://img.shields.io/static/v1?label=BY&message=Yothu&color=blue)
![](https://img.shields.io/static/v1?label=BY&message=Bondok6&color=yellow)
![](https://img.shields.io/static/v1?label=BY&message=fherrerao&color=red)
![](https://img.shields.io/static/v1?label=BY&message=sj1978&color=blue)

# Reservify app
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![React](https://img.shields.io/badge/react-%23316192.svg?style=for-the-badge&logo=react&logoColor=white)
![Redux](https://img.shields.io/badge/redux-%23563D7C.svg?style=for-the-badge&logo=redux&logoColor=white)

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./MIT.md)
![rails version](https://img.shields.io/badge/Rails-7-red)
![ruby version](https://img.shields.io/badge/Ruby-3.x-orange)

## Table of Contents
- [Api Documentation](#api-documentation)
- [Description](#description)
- [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Clone Repo](#clone-repo)
  - [Prerequisites](#prerequisites)
  - [Install Rails](#install-rails)
- [Setup](#setup)
  - [System Dependencies](#system-dependencies)
  - [Database Initialization](#database-initialization)
- [Usage](#usage)
  - [Start Server](#start-server)
  - [Testing RSpec](#testing-rspec)
- [How To Contribute?](#how-to-contribute)
- [Collaborators](#collaborators)
- [Show Your Support](#how-your-support)
- [Acknowledgments](#acknowledgments)
- [License](#license)
<hr>

## Api Documentation
>You can review the documentation for the API [here](https://documenter.getpostman.com/view/13085631/Uz5MEZ6D#d4697ce8-cda6-4658-9891-aca869e0acc9).
<hr>

## Description
> Web application where users should sign in once you are in you can choose a hotel from a list then reserve, cancel and see your room reservation.
<hr>

## Built With

- Major languages: Ruby, HTML, Javascript, Bootstrap 5.
- Frameworks: Ruby on Rails, React&Redux.
- Tools & Methods: RSpec, PostgreSQL, JWT, Jest, Sass, Linters.
<hr>

## Getting Started

We'll need to prepare your computer to handle Ruby on Rails, which might be a hassle, so take a deep breath and cope with me :)

If you have Rails 7 installed, you can skip to the [Setup](#setup) section

## Clone Repo

First clone this repo by running this command in your terminal:
~~~ bash
git clone https://github.com/Yothu/reservify-back-end.git
# wait a couple seconds for it to download
# ...
# ...
# then move into the new directory
cd reservify-back-end
~~~

<hr>

## Prerequisites

The following technologies must be installed before hand in your local machine:

 - Ruby (ruby --version). Should be 3.0.1 or newer.
 - Postgres ('pg', '~> 1.1')
 - Node.js (node --version)
 

The commands in parenthesis `()` can be used to verify if they are installed and their corresponding versions.

Refer to [Section 3](https://guides.rubyonrails.org/v5.1/getting_started.html#:~:text=3%20Creating%20a%20New%20Rails%20Project) from the official [Rails Guide](https://rubyonrails.org/) for more detailed instructions on how to install these technologies.

### Install Rails
Once that's done, we can install Rails. For that, run these commands in your terminal:
~~~ bash
gem install rails
# wait a few seconds for it to download
# ...
# ...
# verify that it was installed by running
rails --version
~~~
<hr>

## Setup

We're getting there... trust me ;)

## System Dependencies

Execute this command to automatically install all the dependencies needed to view and work on this project:

~~~ bash
bundle install
~~~

The full list of dependencies can be found within the [Gemfile](Gemfile).

This also installs PostgreSQL, which you'll need for the next step.
<hr>

## Database Initialization
To initialize the database we just created, now run:
~~~ bash
rails db:setup
~~~
<hr>

## Usage
If you got to this point, congratulations! You now have spent 2 hours in order to toy with my app. I appreciate your effort :P

## Start Server
The following command should start a server
~~~ bash
rails server
~~~
Which you can visit by going to http://localhost:3000 in your browser.
<hr>

## Testing RSpec
RSpec tests belong in another folder, which is [/spec](/spec/), all thanks to the ruby **magic** called `naming conventions`.
Anyway, to run tests located in the spec folder run:
~~~ bash
bundle exec rspec spec
~~~
<hr>

## How To Contribute?

Always remember to commit your contributions on a different branch. You can create a new one by running `git checkout -b <branchname>`.

Visit [linters folder](.github/workflows/linters.yml) to learn how to setup linters.

Then check linters locally before pushing by running:
~~~ bash
npx stylelint "**/*.{css,scss}"
# ...
# ...
rubocop --color -A
~~~

Finally, once your changes have no linter errors and all [tests](#testing-rails) are passing, try to merge your branch into  `development` by running:
~~~ bash
git checkout development
git merge <branchname>
~~~
Continue by solving any merge conflicts that may arise, test the functionality of the app once more, and you're changes are ready to be pushed with `git push origin <branchname>`
<hr>

# That's all folks!

## Collaborators
👤 **Eduardo**

 Platform | Badge |
 --- | --- |
 **GitHub**  | [@eduardosancho](https://github.com/eduardosancho)
 **Twitter** | [@sanchitobless](https://twitter.com/sanchitobless)
 **LinkedIn** | [Eduardo Sancho Solano](https://www.linkedin.com/in/eduardo-sancho-solano/)
<hr>

👤 **Fernando Herrera**

Platform | Badge |
 --- | --- |
 **GitHub**  | [@fherrerao](https://github.com/fherrerao)
 **Twitter** | [Fernando Herrera](https://www.linkedin.com/in/fherrerao/)
 **LinkedIn** | [Fernando Herrera](https://twitter.com/fherrera0206)

 👤 **Kyrillos Hany**

Platform | Badge |
 --- | --- |
 **GitHub**  | [@Bondok6](https://github.com/Bondok6)
 **Twitter** | [Kyrillos Hany](https://twitter.com/kyrilloshany99)
 **LinkedIn** | [LinkedIn](https://www.linkedin.com/in/kyrillos-hany/)

 👤 **David Vergaray**

Platform | Badge |
 --- | --- |
 **GitHub**  | [@Yothu](https://github.com/Yothu) 
 **LinkedIn** | [David Vergaray](https://www.linkedin.com/in/david-vergaray-almontes-051a11127/)

 👤 **Anibal Amoroso**

Platform | Badge |
 --- | --- |
 **GitHub**  | [@githubhandle](https://github.com/sj1978)
 **LinkedIn** | [LinkedIn](https://linkedin.com/in/anibalamoroso)

<hr>
 
## Show your support

Give a ⭐️ if you like this project!
<hr>

## Acknowledgments

Original design [Vespa](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign/modules/173005583) by [Murat Korkmaz](https://www.behance.net/muratk) on [Behance](https://www.behance.net/)

The ideas and inspiration from this project are coming from this online school of software development:

## [**Microverse**](https://www.microverse.org/)
<hr>

## 📝 License

This project is [MIT](./MIT.md) licensed.
