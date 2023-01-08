const request = require('supertest');

var app = require('./server').app;

describe('GET', function() {
	it('should return Hello WORLD', function (done) {
		request(app)
			.get('/')
			.expect('Hello WORLD')
			.end(done);
	});
});
