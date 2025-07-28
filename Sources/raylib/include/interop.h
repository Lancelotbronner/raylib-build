//
//  interop.h
//  raylib
//
//  Created by Christophe Bronner on 2025-05-01.
//

#pragma once

union MD5 {
	unsigned int components[4];
	unsigned char bytes[4*sizeof(unsigned int)];
};

void _LoadMD5(union MD5 *hash, const unsigned int *data) {
	hash->components[0] = data[0];
	hash->components[1] = data[1];
	hash->components[2] = data[2];
	hash->components[3] = data[3];
};

union SHA1 {
	unsigned int components[5];
	unsigned char bytes[5*sizeof(unsigned int)];
};

void _LoadSHA1(union SHA1 *hash, const unsigned int *data) {
	hash->components[0] = data[0];
	hash->components[1] = data[1];
	hash->components[2] = data[2];
	hash->components[3] = data[3];
	hash->components[4] = data[4];
};
