'use strict';
const Generator = require('yeoman-generator');
const chalk = require('chalk');
const yosay = require('yosay');
const path = require('path');

module.exports = class extends Generator {
  constructor(args, opts) {
    super(args, opts);

    this.argument('docker', {type: String, required: false});
  }

  initializing() {
    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the ' + chalk.yellow('generator-docker') + ' generator!'
    ));
  }

  prompting() {
    const prompts = [{
      type: 'input',
      name: 'docker',
      message: 'New docker name',
      default: this.options.docker // Default to first argument
    }];

    return this.prompt(prompts).then(props => {
      // To access props later use this.props.<name>;
      this.props = props;
    });
  }

  writing() {
    this.fs.copyTpl(
      this.templatePath('Dockerfile'),
      this.destinationPath(path.join(this.props.docker, 'Dockerfile')),
      {
        props: this.props
      }
    );
    this.fs.copyTpl(
      this.templatePath('CHANGELOG.md'),
      this.destinationPath(path.join(this.props.docker, 'CHANGELOG.md')),
      {
        props: this.props
      }
    );
    this.fs.copyTpl(
      this.templatePath('README.md'),
      this.destinationPath(path.join(this.props.docker, 'README.md')),
      {
        props: this.props
      }
    );
  }

  install() {
    // This.installDependencies();
    // this.log(chalk.red('installing generator-docker generator!'));
  }

  end() {
    this.log(yosay(
      'finished generating ' + chalk.green('generator-docker') + '.'
    ));
  }
};
