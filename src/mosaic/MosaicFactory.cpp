#include "MosaicFactory.hpp"

MosaicFactory::MosaicFactory(){

}

MosaicFactory::~MosaicFactory(){}


void MosaicFactory::addImgs(string imgsList){
    ifstream ifs(imgsList.c_str());
    string buf;
    while(ifs && getline(ifs, buf)){
        imgs.push_back(buf);
    }
}

Mat MosaicFactory::generateMosaic(Mat& input, int x = 10, int y = 10){
    assert(0 == input.rows % x && 0 == input.cols % y);

    std::vector<string> images; 

    Mat origin(640, 640, CV_8UC3);
    cv::resize(input, origin, origin.size());

    int stepX = input.cols / x;
    int stepY = input.rows / y;

    for(int j = 0; j < y; j += stepY){
        for(int i = 0; i < x; i += stepX){
            Mat patch(origin, cv::Rect(i, j, stepX, stepY));
            string img = getSimilarImg(patch);
            images.push_back(img);
            std::cout << img << std::endl;
        } 
    }

    return input.clone();
}

void getBestImg(Mat& patch, MosaicInfoElem& best);
