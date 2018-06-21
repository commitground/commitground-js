var assert = require('chai').assert;
var commitground = require('../index.js');

describe('hello()', function() {
  it('should return "world"', function() {
    assert(commitground.hello() === 'world', 'Passed Hello world test')
  })
})
