#!/bin/bash
# potentially handy commands
# aws s3 cp static/yaml/Workshop-test.yml s3://cvhxp-aiml-workshop-cftemplates
# aws s3api put-object-acl --bucket cvhxp-aiml-workshop-cftemplates --key Workshop-test.yml --acl public-read
# aws s3 ls 
# generate S3 presigned URLS for all the CF templates in this build and create a hugo build script
# that sets them in the environment for Hugo to use
# $1 is the S3 bucket prefix where the yml files in static/yaml will be deployed (does not need to be public)
#  Note, do not include trailing slash e.g. s3://cvhxp-aimlws-build-artifacts/yaml

# Changes for prod, just assume all the URLs run from the hard coded prod URL. (should be a build var)

shopt -s nullglob
echo "#!/bin/bash" > buildhugo.sh
cd static/yaml
for f in *
do
    nodash=${f//-/_}
    #echo "aws s3 presign $1/$f --expires-in 604800"
    #psurl=`aws s3 presign $1/$f --expires-in 604800`
    psurl="https://virtual-aiml-loft-site.s3-ap-southeast-2.amazonaws.com/yaml/$f"
    echo "export ${nodash//./_}=\"$psurl\"" >> ../../buildhugo.sh
done
echo "hugo -v" >> ../../buildhugo.sh
chmod ugo+x ../../buildhugo.sh
echo "Build Script:"
cat ../../buildhugo.sh