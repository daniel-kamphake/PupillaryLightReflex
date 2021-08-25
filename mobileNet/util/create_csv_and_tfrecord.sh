eval "$(conda shell.bash hook)"
conda activate ML

echo 'Creating CSV for eye_detection 0/3'

python xml_to_csv.py -i $(pwd)/eye_detection/test -o $(pwd)/eye_detection/test_label.csv -l $(pwd)/eye_detection
python xml_to_csv.py -i $(pwd)/eye_detection/train -o $(pwd)/eye_detection/train_label.csv -l $(pwd)/eye_detection
echo 'Creating CSV for iris_detection 1/3'

python xml_to_csv.py -i $(pwd)/iris_detection/test -o $(pwd)/iris_detection/test_label.csv -l $(pwd)/iris_detection
python xml_to_csv.py -i $(pwd)/iris_detection/train -o $(pwd)/iris_detection/train_label.csv -l $(pwd)/iris_detection
echo 'Creating CSV for pupil_detection 2/3'

python xml_to_csv.py -i $(pwd)/pupil_detection/test -o $(pwd)/pupil_detection/test_label.csv -l $(pwd)/pupil_detection
python xml_to_csv.py -i $(pwd)/pupil_detection/train -o $(pwd)/pupil_detection/train_label.csv -l $(pwd)/pupil_detection
echo 'Done creating CSVs 3/3'

echo 'Creating tfrecord for eye_detection 0/3'
python generate_tfrecord.py --csv_input=$(pwd)/eye_detection/train_label.csv  --output_path=$(pwd)/eye_detection/train.record --label_map=$(pwd)/eye_detection/label_map.pbtxt --img_path=$(pwd)/eye_detection/train/
python generate_tfrecord.py --csv_input=$(pwd)/eye_detection/test_label.csv  --output_path=$(pwd)/eye_detection/test.record --label_map=$(pwd)/eye_detection/label_map.pbtxt --img_path=$(pwd)/eye_detection/test/
echo 'Creating tfrecord for eye_detection 1/3'

python generate_tfrecord.py --csv_input=$(pwd)/iris_detection/train_label.csv  --output_path=$(pwd)/iris_detection/train.record --label_map=$(pwd)/iris_detection/label_map.pbtxt --img_path=$(pwd)/iris_detection/train/
python generate_tfrecord.py --csv_input=$(pwd)/iris_detection/test_label.csv  --output_path=$(pwd)/iris_detection/test.record --label_map=$(pwd)/iris_detection/label_map.pbtxt --img_path=$(pwd)/iris_detection/test/
echo 'Creating tfrecord for eye_detection 2/3'

python generate_tfrecord.py --csv_input=$(pwd)/pupil_detection/train_label.csv  --output_path=$(pwd)/pupil_detection/train.record --label_map=$(pwd)/pupil_detection/label_map.pbtxt --img_path=$(pwd)/pupil_detection/train/
python generate_tfrecord.py --csv_input=$(pwd)/pupil_detection/test_label.csv  --output_path=$(pwd)/pupil_detection/test.record --label_map=$(pwd)/pupil_detection/label_map.pbtxt --img_path=$(pwd)/pupil_detection/test/
echo 'Done creating tfrecords 3/3'