These files may be used to create a tfrecord dataset. 

With the xml_to_csv.py file you can translate all xml files in the 
dataset folder to a single csv file. The xmls must follow the given
structure and may contain multiple selctions. 

generate_tfrecord.py takes the csv file, a label map and an 
output path as inputs. You may need to execute it once for each 
dataset (test and train).


USAGE: TFRECORD
python generate_tfrecord.py 
	--csv_input=<PATH_TO_ANNOTATIONS_FOLDER>/<train/test>_labels.csv  
	--output_path=<PATH_TO_ANNOTATIONS_FOLDER>/<train/test>.record 
	--label_map=<PATH_TO_ANNOTATIONS_FOLDER>/label_map.pbtxt

USAGE: XML_TO_CSV
python xml_to_csv.py 
	-i [PATH_TO_IMAGES_FOLDER]/train 
	-o [PATH_TO_ANNOTATIONS_FOLDER]/train_labels.csv

USAGE: CREATE CSV AND TFRECORD
!./create_csv_and_tfrecord.sh
