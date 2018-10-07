from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt
physiolibrary = '..\\..\\..\\..\\Physiolibrary'

my_fmu = compile_fmu('Physiolibrary.Thermal.Examples.MuscleHeat',physiolibrary)
model = load_fmu(my_fmu)
res = model.simulate()
plt.figure(1)
plt.plot(res['time'],res['muscle.T'])
plt.legend(('Muscle'))
plt.title('MuscleHeat')
plt.ylabel('Temperature (K)')
plt.xlabel('Time (s)')

my_fmu = compile_fmu('Physiolibrary.Thermal.Examples.ThermalBody_QHP',physiolibrary)
model = load_fmu(my_fmu)
res = model.simulate()
plt.figure(2)
plt.plot(res['time'],res['skin.T'],res['time'],res['core.T'],res['time'],res['skeletalMuscle.T'],res['time'],res['GILumen.T'])
plt.legend(('Skin','Core','Muscle','Gastoro-Intestinal Lumen'))
plt.title('ThermalBody_QHP')
plt.ylabel('Temperature (K)')
plt.xlabel('Time (s)')


plt.show()

