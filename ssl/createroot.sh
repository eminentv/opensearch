PASSWORD=
COUNTRY=
STATE=
LOCALITY=
ORGANIZATION=
ORGANIZATIONALUNIT=
EMAIL=
ROOTCN=rootca
mkdir root
openssl ecparam -name secp521r1 -out root/root-ca-key-temp.pem -genkey && \
openssl pkcs8 -inform PEM -outform PEM -in root/root-ca-key-temp.pem -topk8 -nocrypt -v2prf hmacWithSHA256 -out root/root-ca-key.pem && \
openssl req -new -x509 -sha256 -days 760 -key root/root-ca-key.pem -out root/root-ca.pem -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONALUNIT/CN=$ROOTCN/emailAddress=$EMAIL"
rm root/root-ca-key-temp.pem
