from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt
physiolibrary = '..\\..\\..\\..\\Physiolibrary'

my_fmu = compile_fmu('Physiolibrary.Osmotic.Examples.Cell',physiolibrary)
model = load_fmu(my_fmu)
res = model.simulate()
plt.figure(1)
plt.subplot(211)
plt.plot(res['time'],res['cells.volume'],res['time'],res['interstitium.volume'])
plt.legend(('Cells','Interstitium'))
plt.title('Cells in hypotonic environment')
plt.ylabel('Volume (m3)')
plt.xlabel('Time (s)')
plt.subplot(212)
plt.plot(res['time'],res['cells1.volume'],res['time'],res['interstitium1.volume'])
plt.legend(('Cells','Interstitium'))
plt.title('Cells in hypertonic environment')
plt.ylabel('Volume (m3)')
plt.xlabel('Time (s)')



plt.show()

