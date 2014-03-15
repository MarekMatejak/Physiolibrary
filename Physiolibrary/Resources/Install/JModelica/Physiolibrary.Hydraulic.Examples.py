from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt
physiolibrary = '..\\..\\..\\..\\Physiolibrary'

my_fmu = compile_fmu('Physiolibrary.Hydraulic.Examples.CardiovascularSystem_GCG',physiolibrary)
model = load_fmu(my_fmu)
res = model.simulate()
plt.figure(1)
plt.subplot(311)
plt.plot(res['time'],res['arteries.q_in.pressure'],res['time'],res['veins.q_in.pressure'],res['time'],res['pulmonaryArteries.q_in.pressure'],res['time'],res['pulmonaryVeins.q_in.pressure'])
plt.legend(('Systemic Arteries','Systemic Veins','Pulmonary Arteries','Pulmonary Veins'))
plt.title('CardiovascularSystem_GCG')
plt.ylabel('Mean Blood Pressure (Pa)')
plt.xlabel('Time (s)')
plt.subplot(312)
plt.plot(res['time'],res['arteries.volume'],res['time'],res['veins.volume'],res['time'],res['pulmonaryArteries.volume'],res['time'],res['pulmonaryVeins.volume'])
plt.legend(('Systemic Arteries','Systemic Veins','Pulmonary Arteries','Pulmonary Veins'))
plt.ylabel('Mean Blood Volume (m3)')
plt.xlabel('Time (s)')
plt.subplot(313)
plt.plot(res['time'],res['leftHeart.q'],res['time'],res['rightHeart.q'],res['time'],res['largeVeins.q_out.q'])
plt.legend(('Left Heart Cardiac Output','Right Heart Cardiac Output',"Systemic Lagre Veins"))
plt.ylabel('Mean Blood Flow (m3/s)')
plt.xlabel('Time (s)')

plt.show()

