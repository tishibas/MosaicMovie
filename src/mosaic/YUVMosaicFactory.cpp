#include "YUVMosaicFactory.hpp"

YUVMosaicFactory::YUVMosaicFactory(){}
YUVMosaicFactory::~YUVMosaicFactory(){}

std::string YUVMosaicFactory::getSimilarImg(cv::Mat& patch){
    std::string matchImg = "name";
    double score = DBL_MAX;
    
    std::vector<string>::iterator it = imgs.begin();
    while(it != imgs.end()){
        cv::Mat tmp = cv::imread(*it);
        cv::Mat diff;

        cv::Mat tmp_gray;
        cv::Mat patch_gray;
        cv::Mat diff_gray;

        cvtColor(tmp, tmp_gray, CV_RGB2GRAY);
        cvtColor(patch, patch_gray, CV_RGB2GRAY);

        cv::absdiff(tmp, patch, diff);
        cv::absdiff(tmp_gray, patch_gray, diff_gray);
        cv::Scalar s = cv::mean(diff);
        cv::Scalar s_gray = cv::mean(diff_gray);

        double sum = s_gray[0] * 3 + s[0] + s[1] + s[2];
        if(sum < score){
            score = sum;
            matchImg = *it;
        }
        ++it;
    }

    return matchImg;
}


