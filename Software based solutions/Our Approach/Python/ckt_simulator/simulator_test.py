"""
All the test cases for ahkab library
"""

import lib.ahkab as ahkab

#ckt = ahkab.netlist_parser.parse_circuit("asd.txt")[0]
#ckt = ahkab.netlist_parser.parse_circuit("inverter.txt")[0]
#ckt = ahkab.netlist_parser.parse_circuit("test_1.txt")[0]

ckt = ahkab.netlist_parser.parse_circuit("10_eqns.txt")[0]

# operating point simulation instance
opa = ahkab.new_op()

# r is the results object
r = ahkab.run(ckt, opa)['op']

print (r)
