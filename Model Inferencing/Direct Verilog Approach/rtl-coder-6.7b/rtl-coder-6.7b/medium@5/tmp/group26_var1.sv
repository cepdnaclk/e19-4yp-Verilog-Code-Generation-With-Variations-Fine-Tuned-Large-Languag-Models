module fixed_range(a, b, c);
input a, b, c;
output [b:a] d;
wire [b:a] e;
wire [b-1:a] f;
always @(a or b or c) begin
    if (c < 1)
        f = a;
    else if (c > b)
        f = b - 1;
    else
        f = c;
end
assign d = e[f];
endmodule
### Run Code:
vvp example5.vvp#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <string.h>

int main(int argc, char *argv[]){
	char *arg1, *arg2;
	arg1 = argv[1];
	arg2 = argv[2];
	int pid = fork();
	if(pid == 0){
		dup2(STDOUT_FILENO, 1);
		execl(arg1, arg1, arg2, NULL);
	} else {
		wait(NULL);
		int fd = open(arg2, O_CREAT|O_RDWR|O_TRUNC, 0660);
		dup2(fd, 1);
		execl(arg1, arg1, arg2, NULL);
	}
	return 0;
}
from __future__ import division

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, 0:3].values
y = dataset.iloc[:, 3].values

# Taking care of missing data
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy ='mean', axis = 0)
imputer = imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])

# Encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

# Fitting Multiple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Predicting the Test set results
y_pred = regressor.predict(X_test)

# Building the optimal model using Backward Elimination
import statsmodels.formula.api as sm
# Add column of 1 to the first column of X
X = np.append(arr = np.ones((50,1)).astype(int), values = X, axis = 1)
# X_opt = X[:, [0,1,2,3,4,5]]
# reg_OLS = sm.OLS(endog = y, exog = X_opt).fit()
# reg_OLS.summary()
import matplotlib.pyplot as plt
import numpy as np
def gradientDescent(x, y, theta, alpha, numIterations):
        m = len(y)
        for i in range(0, numIterations):
                # print i
                theta[0] = theta[0] - alpha * (1.0/m) * sum(np.dot(x, theta) - y)
                theta[1] = theta[1] - alpha * (1.0/m) * sum((np.dot(x, theta) - y) * x[:,1])
                # print (np.dot(x, theta) - y)
        return theta
alpha = 0.01
numIterations = 1000
theta = np.zeros(2)
x = np.loadtxt('data2.txt', delimiter=',')
X = np.c_[np.ones((x.shape[0], 1)), x]
y = x[:, 2]
theta = gradientDescent(X, y, theta, alpha, numIterations)
print theta
x = np.loadtxt('data2.txt', delimiter=',')
X = np.c_[np.ones((x.shape[0], 1)), x]
y = x[:, 2]
plt.figure()
plt.scatter(x[:,1], y, marker = 'x', color ='red')
plt.plot(x[:,1], np.dot(X, theta), color = 'blue')
plt.xlabel('Population of city in 10,000s')
plt.ylabel('Profit in $10,000s')
plt.show()

def costFunction(X, y, theta):
        m = len(y)
        J = (np.dot(X, theta) - y) * (np.dot(X, theta) - y)
        J = J.sum() / (2 * m)
        return J
J = costFunction(X, y, theta)
print J
This is the code used for the machine learning class at USC.import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(-10, 10, 100)
y = np.exp(x)
plt.plot(x, y, lw=2)
plt.show()import matplotlib.pyplot as plt
import numpy as np

# Importing the dataset
dataset = pd.read_csv('../datasets/Social_Network_Ads.csv')
X = dataset.iloc[:, 2:4].values
y = dataset.iloc[:, 4].values

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

# Fitting Logistic Regression to the Training set
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)

# Visualising the Training set results
from matplotlib.colors import ListedColormap
X_set, y_set = X_train, y_train
X1, X2 = np.meshgrid(np.arange(start = X_set[:, 0].min() - 1, stop = X_set[:, 0].max() + 1, step = 0.01),
                     np.arange(start = X_set[:, 1].min() - 1, stop = X_set[:, 1].max() + 1, step = 0.01))
plt.contourf(X1, X2, classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('Logistic Regression (Training set)')
plt.xlabel('Age')
plt