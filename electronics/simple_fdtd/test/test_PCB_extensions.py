import pytest

from PCB_extensions import *

fdtd.set_backend("torch.cuda.float32")

def test_answer():
    import_svg_pcb('test/test.svg',0.0002)
    # assert
