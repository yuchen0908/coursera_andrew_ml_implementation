import scipy.io
import pandas as pd
import os
os.chdir("E:\\Projects\\datascience\\20211116_ml_lab")

#########################################################################
# 1.get data
data_dir = "E:\\Projects\\datascience\\20211114_coursera_ml\\wk7"
data1 = scipy.io.loadmat(f"{data_dir}\\ex6data1.mat")
data2 = scipy.io.loadmat(f"{data_dir}\\ex6data2.mat")
data3 = scipy.io.loadmat(f"{data_dir}\\ex6data3.mat")

# convert to pandas dataframe
def tf_mat(data):
    df = pd.DataFrame(columns=['x1','x2','y'])
    df['x1'] = data['X'][:,0]
    df['x2'] = data['X'][:,1]
    df['y'] = data['y']
    return df

df1 = tf_mat(data1)
df2 = tf_mat(data2)
df3 = tf_mat(data3)

#########################################################################
# 2.plot data
import matplotlib.pyplot as plt
plt.figure(figsize= (12,4))
for i in range(1,4):
    exec(f"plt.subplot(13{i})")
    exec(f"plt.scatter(df{i}[df{i}['y'] == 1]['x1'], df{i}[df{i}['y'] == 1]['x2'], marker='x')")
    exec(f"plt.scatter(df{i}[df{i}['y'] == 0]['x1'], df{i}[df{i}['y'] == 0]['x2'], marker='o')")
    exec(f"plt.xlabel('x1')")
    exec(f"plt.ylabel('x2')")
    exec(f"plt.title('data{i}')")
plt.show()

#########################################################################
# 3. explore C's effect in SVM
# in ML Course, svmTrain controls parameters C, kernel, tol and max_iter
# tol is a tolerance value used for determining equality of floating point numbers;
# max_iter controls the number of iterations

from sklearn.svm import SVC 
# ref of sklearn's svc https://scikit-learn.org/stable/modules/generated/sklearn.svm.SVC.html

params = {"C":1, "kernel":"linear", "tol":1e-3, "max_iter":20}
params_str = ",".join([k + "=" + "'" + v + "'" if isinstance(v,str) == True else k + "=" + str(v) for k,v in params.items()])
exec(f"model = SVC({params_str})")
model.fit(data1["X"], data1["y"])
if "yhat" not in df1.columns:
    df1['yhat'] = model.predict(data1["X"])

def draw_svm_db(model, kernel = 'linear'):
    if kernel == 'linear':
        # calculate decision boundary
        pass
    elif kernel == 'gaussian':
        pass
    else:
        pass