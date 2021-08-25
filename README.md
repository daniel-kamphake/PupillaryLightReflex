# pupil-detection

This project contains the code for my master thesis.  
It revolves around the Machine Learning model to measure the shrinkage of the pupil diameter during a spontaneous light impulse on mobile devices. 

How to set up the environment:
	* $conda create --name thesis_kamphake
	* $conda install pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch (depends on cuda version)
	* $cd yolov5
	* $pip install -r requirements.txt
	* $pip install wandb (optional)

How create the Dataset:
	* Download the Unity Model from https://www.cl.cam.ac.uk/research/rainbow/projects/unityeyes/
	* Generate images with the prefered settings (1600x1200, fantastic, 0-15, 0-15)
	* Move the images to pupil_detection/raw_dataset/imgs/
	* Start jupyter-notebook
	* Open `UnityEyes_to_Dataset`
		* Change `if False:` to `if True`
		* Follow the instructions in the Notebook

How to train the models:
	* Prepare the Dataset
	* Create a Weights and Biases account for tracking (highly encouraged)
	* Follow the instructions in the notebook