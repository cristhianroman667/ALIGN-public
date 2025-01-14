import pathlib
from ..schema.parser import SpiceParser
from ..schema.subcircuit import SubCircuit
from ..schema import constraint
from ..primitive import main

import logging
from ..schema.library import Library
from .util import get_generator


logger = logging.getLogger(__name__)


def read_models(pdk_dir: pathlib.Path, config_path=None):

    pdk_models = get_generator('pdk_models', pdk_dir)
    library = Library(loadbuiltins=True, pdk_models=pdk_models)
    ckt_parser = SpiceParser(library=library)

    model_statements = pdk_dir / "models.sp"

    if not model_statements.exists():
        logger.warning(f"Missing {model_statements}, only basic models will be used")
    else:
        logger.debug(f"Using model file from {model_statements}")
        with open(model_statements, 'r') as f:
            lines = f.read()
        ckt_parser.parse(lines)
    return ckt_parser


def read_lib(pdk_dir: pathlib.Path,  config_path=None):
    # Read model file to map devices

    lib_parser = read_models(pdk_dir)
    if config_path is None:
        config_path = pathlib.Path(__file__).resolve().parent.parent / "config"

    lib_files = ["basic_template.sp", "user_template.sp"]
    for lib_file in lib_files:
        lib_file_path = pdk_dir / lib_file
        if not lib_file_path.exists():
            lib_file_path = config_path / lib_file
        assert lib_file_path.exists(), f"file not found {lib_file_path}"
        with open(lib_file_path) as f:
            lines = f.read()
        lib_parser.parse(lines)
    for subckt in lib_parser.library:
        if isinstance(subckt, SubCircuit):
            if main.get_generator(subckt.name, pdk_dir):
                subckt.add_generator(subckt.name)
            else:
                for const in subckt.constraints:
                    if isinstance(const, constraint.Generator) and const.name:
                        subckt.add_generator(const.name.upper())
    return lib_parser.library


def order_lib(library):
    primitives = [
        v for v in library
        if isinstance(v, SubCircuit)
    ]
    # TODO: update the order based on weighing mechanism
    primitives.sort(
        key=lambda x: (len(x.elements),
                       1 / len(x.nets),
                       len(set([e.model for e in x.elements]))),
        reverse=True,
    )
    logger.debug(f"all library elements: {[ele.name for ele in primitives]}")

    return primitives
