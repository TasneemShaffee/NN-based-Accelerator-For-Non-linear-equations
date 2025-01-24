"""
Performs a very simple DC operating point simulation
"""
import sys
sys.path.insert(0, '../ckt_simulator')

import lib.ahkab as ahkab
import pylab

CKT = ahkab.netlist_parser.parse_circuit("test_sweep.txt")[0]
OPA = ahkab.new_dc(0.0, 1, 50, 'V1')
I = ahkab.run(CKT, OPA)['dc']#['I(V1)']
pylab.plot(I['V1'], -I['I(V1)'])
pylab.xlabel('V')
pylab.ylabel('I(V)')
pylab.show()