#ifndef INCLUDED_MOSAICFACTORY
#define INCLUDED_MOSAICFACTORY

#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <opencv2/opencv.hpp>
#include "MosaicInfoElem.hpp"

using namespace std;
using namespace cv;

class MosaicFactory {
    public:
        MosaicFactory();
        ~MosaicFactory();
        void addImgs(string imgsList);
        Mat generateMosaic(Mat& input, int x, int y);
    protected:
        vector<string> imgs; 
        double getBestImg(Mat& patch);
        virtual std::string getSimilarImg(cv::Mat& patch) = 0;
};



#endif
