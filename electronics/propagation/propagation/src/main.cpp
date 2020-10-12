#include <james.hpp>

//export OMP_NUM_THREADS=1
//make -j15 && ./src/james
//gprof ./src/james gmon.out
//sudo perf stat ./src/james
//valgrind --tool=massif ./src/james
//valgrind ms_print

int main(){
    feenableexcept(FE_INVALID | FE_OVERFLOW);




    









    fedisableexcept(FE_ALL_EXCEPT);

    mglGraph gr;
    mglData x_pos_mgl;
    mglData x_force_mgl;

    x_pos_mgl.Link(x_position.data(),x_position.size());
    x_force_mgl.Link(x_force.data(),x_force.size());

    gr.SubPlot(1,2,0);
    gr.Box();
    gr.SetRange('y',*min_element(x_position.begin(), x_position.end()),*max_element(x_position.begin(), x_position.end()));
    gr.Plot(x_pos_mgl,"Y");
    gr.Axis();

    gr.SubPlot(1,2,1);
    gr.Box();
    gr.SetRange('y',*min_element(x_force.begin(), x_force.end()),*max_element(x_force.begin(), x_force.end()));
    gr.Plot(x_force_mgl,"R");
    gr.Axis();

    gr.WriteFrame("test.png");

}
