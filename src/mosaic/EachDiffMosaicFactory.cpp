#include "EachDiffMosaicFactory.hpp"

EachDiffMosaicFactory::EachDiffMosaicFactory(){}
EachDiffMosaicFactory::~EachDiffMosaicFactory(){}

std::string EachDiffMosaicFactory::getSimilarImg(cv::Mat& patch){
    std::string matchImg = "name";
    double score = DBL_MAX;
    
    std::vector<string>::iterator it = imgs.begin();
    while(it != imgs.end()){
        cv::Mat tmp = cv::imread(*it);
        cv::Mat diff;
        cv::absdiff(tmp, patch, diff);
        cv::Scalar s = cv::mean(diff);

        double sum = s[0] + s[1] + s[2];
        if(sum < score){
            score = sum;
            matchImg = *it;
        }
        ++it;
    }

    return matchImg;
}


