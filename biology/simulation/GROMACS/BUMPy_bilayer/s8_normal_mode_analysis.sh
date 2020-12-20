TRAVIS_DIR="/home/arthurdent/Programs/travis-src-200504-hf2/exe/"

rm output/s8/*

cp travis_input.txt output/s8/travis_input.txt

cd output/s8/
$TRAVIS_DIR/travis -p ../s7/trajectory.pdb -i travis_input.txt
