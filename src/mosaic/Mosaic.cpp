#include "Mosaic.hpp"


Mosaic::Mosaic(int rows, int cols) : _rows(rows), _cols(cols) {
    infos.reserve(rows * cols);
}

Mosaic::~Mosaic(){}

void Mosaic::outputMosaicInfo(){
    std::vector<MosaicInfoElem>::iterator it = infos.begin();
    while(it != infos.end()){
        it->output();
        ++it;
    }
}

