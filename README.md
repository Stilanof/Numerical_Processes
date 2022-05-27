# Numerical_Processes 🤖
This repository will be implemented as a documentary site for the practical works of the course: numerical processes. The team will evaluate real research problems using the different methods learned during the semester: equations of one variable, systems of equations, and interpolation. 

## The team 👩🏻‍💻👨‍💻

We are bachelor's students in production and mechanical engineering.

* **Pablo Marulanda** 
* **Sara Mejía** 
* **Sergio Salazar** 
* **Susana Tilano** 

## *Let's start* 🚀
### Case of study #1 
The Colebrook-White equation es the relationship between the friction factor and the reynolds number in which appears the pipe diameter and its roughness. It`s usefulness is to find the friction factor for the sample given. The factors that this depends on may change with the material or the place where it is in, most of the things are implied in the formula that shows exactly what the value of the friction is. For the accuracy of the result, we use 7 mathematical methods to iterate and find the closest value of the actual result. This is a system that can be fastly solved with this methods to find the friction factor of the pipe that carries the fluid. 

#### For:
f- Friction factor \
ε- rugosity of the surface layer (m)\
μ - Dynamic viscidity (Pa/s) \
D- Diameter of the pipe (m)\
Re- Reynolds number 

For the equation:\
[![ecuacion.jpg](https://i.postimg.cc/C5W73ypg/ecuacion.jpg)](https://postimg.cc/kRvWSp51)

#### For finding Reynolds Number:
V- Speed of the fluid (m/s)\
D- Diameter of the pipe (m)\
de- Density of the fluid (Kg/m^3) \
μ- Dynamic viscidity (Pa/s)

For the equation:\
[![Ecuacion2.jpg](https://i.postimg.cc/sgfmb4t1/Ecuacion2.jpg)](https://postimg.cc/rKb5rxyL)




### Case of study #2
A manufacturing plant produce high quality diverse biscuits, for that, the layout consists of four sublines of production: black chocolate, white chocolate, cream & cookies, and coffee references.
All the refences are done by the same four subprocesses. (Mixing, baking, cooling, packaging). The enterprise biscuit’s formula stipulates that each reference must have the same base time/1000 units in each one of them to always accomplish the best quality.

![Image text](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/img/subprocesses.png)

Depending on the reference a time adjusment factor is considered as following:![Image text](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/img/adjustment%20factor%201.png)


The operators know the total time of production of each reference as well, but they lost the base times documentation.
![Image text](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/img/total%20production%20times%201.png)



The company needs a program that help the operators re-write the base times documentation and start producing again soon.

## Case of study #3

A company needs to make plastic chairs, for this, they need to buy plastic injection machines that can satisfy the required processing time so that their manufacture is the most profitable and effective.

The manufacturer has a table that indicates by machine number it makes certain quantities of chairs and is as follows:

![](Screenshot_2022-05-19-20-19-20-123_com.microsoft.office.excel.jpg)

where x1 is the number of machines and x2 is the number of chairs made per minute

taking into account the previous table, we see that due to the budget it is necessary to buy 40 machines.

![](https://github.com/Stilanof/Numerical_Processes/blob/main/Screenshot_2022-05-19-18-50-18-122_com.microsoft.office.excel~2.jpg)

we take this block where we see that it is within the number of machines that we request.

This is the formula used:

![](https://github.com/Stilanof/Numerical_Processes/blob/main/IMG-20220519-WA0012.jpg)

![](https://github.com/Stilanof/Numerical_Processes/blob/main/IMG-20220519-WA0013.jpg)

and thus concludes how many chairs can be made in 1 minute by 40 machines.


## *Repository explained* 🛠️

For Case of study #1 you will find the following methods for solving equations of one variable:

[1.Bisection](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/1.%20Bisection.m)

[2.Fixed point](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/2.%20Fixed%20Point.m)

[3.Regula falsi](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/3.%20Regula%20Falsa.m)

[4.Newton](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/4.%20Newton.m)

[5.Newton1](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/5.%20Newton%201.m)

[6.Newton2](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/6.%20Newton%202.m)

[7.Secant](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case1/codes/7.%20Secant.m)

For Case of study #2 you will find the following methods for solving systems of equations:

[1.Gaussian elimination (simple,partial pivot and total pivot)](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/Gaussian%20elimination.m)

[2.Iterative methods Jacobi-Gauss-Seidel](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/Iterative_methods_Jacobi_Gauss_Seidel.m)

[2.2 Matricial Jacobi-Gauss-Seidel](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/Matricial_JacobiSeid.m)

[3.Iterative methods SOR)](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case2/SOR.m)


For Case of study #3 you will find the following methods for interpolation:

[1.Vandermonde](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case3/1.%20Vandermonde.m)

[2.Newton (Divided difference method)](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case3/2.%20Newton.m)

[3.Spline (linear, square and cubic)](https://github.com/Stilanof/Numerical_Processes/blob/main/study_case3/3.%20Spline.m)
