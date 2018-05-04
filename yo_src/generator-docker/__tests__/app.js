'use strict';
var path = require('path');
var assert = require('yeoman-assert');
var helpers = require('yeoman-test');

describe('generator-docker:app', () => {
  beforeAll(() => {
    return helpers.run(path.join(__dirname, '../generators/app'))
      .withPrompts({docker: 'test-docker'});
  });

  it('creates files', () => {
    assert.file([
      'test-docker/Dockerfile',
      'test-docker/CHANGELOG.md',
      'test-docker/README.md'
    ]);
  });
});
