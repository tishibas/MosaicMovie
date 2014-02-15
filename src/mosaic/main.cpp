#include "EachDiffMosaicFactory.hpp"

#include <opencv2/opencv.hpp>
#include <string>
#include <iostream>

using namespace std;


int main(int argc, char** argv){
    if(argc != 3){
        std::cout << "wrong the number of arguments: program [inputImage] [imageList]" << std::endl; 
        exit(1);
    }
    Mat input = cv::imread(argv[1]);
    string imgsList = argv[2];
    std::cout << imgsList << std::endl;

    MosaicFactory* mosFac = new EachDiffMosaicFactory();
    mosFac->addImgs(imgsList);
    Mat output = mosFac->generateMosaic(input, 10, 10);
    cv::imwrite("output.jpg", output);
    

    return 0;
}
