PASSWORD=
COUNTRY=
STATE=
LOCALITY=
ORGANIZATION=
ORGANIZATIONALUNIT=
EMAIL=
ROOTCA=./root/root-ca.pem
ROOTKEY=./root/root-ca-key.pem
CERT=sans-$1
CNAME=$2
# IP= or DNS= seperated by coma
SANS=$3
# Creating Traefik Cert
mkdir $CERT
openssl ecparam -name secp521r1 -out $CERT/$CERT-key-temp.pem -genkey && \
openssl pkcs8 -inform PEM -outform PEM -in $CERT/$CERT-key-temp.pem -topk8 -nocrypt -v2prf hmacWithSHA256 -out $CERT/$CERT-key.pem && \
openssl req -new -key $CERT/$CERT-key.pem -out $CERT/$CERT.csr -subj "/C=$COUNTRY/ST=$STATE/L=$LOCALITY/O=$ORGANIZATION/OU=$ORGANIZATIONALUNIT/CN=$CNAME/emailAddress=$EMAIL"
openssl x509 -req -in $CERT/$CERT.csr -CA $ROOTCA -CAkey $ROOTKEY -days 760 -CAcreateserial -sha256 -out $CERT/$CERT.pem -extfile <(printf "subjectAltName=$SANS") && \
cat $CERT/$CERT.pem $ROOTCA > $CERT/$CERT-BUNDLE.pem
rm $CERT/$CERT.csr && \
rm $CERT/$CERT-key.temp.pem
