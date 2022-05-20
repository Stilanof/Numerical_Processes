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
This is an important biological and medical problem, that studies the spread and control of an infectious disease. This is called *epidemological problem*, and if a large percentage of a population adquires the disease it`s called *epidemic*. A simple mathematical model for this is: 

[![formula1casoepidemia.jpg](https://i.postimg.cc/TPRqvy9X/formula1casoepidemia.jpg)](https://postimg.cc/68mGdpgH)

Where *Pi* is the number of infected individuals in time *t* and P is the total population. The solution to this equation is given by separing variables and getting: 

[![formula2casoepidemia.jpg](https://i.postimg.cc/qBnP7SrM/formula2casoepidemia.jpg)](https://postimg.cc/Jtr66Tt9)

This way the problem given by these 2 formulas describes the spread of a disease in a big population, but it has to be finite. 



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

![](https://github.com/Stilanof/Numerical_Processes/blob/main/Screenshot_2022-05-19-18-50-18-122_com.microsoft.office.excel.jpg)

where x1 is the number of machines and x2 is the number of chairs made per minute





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

[1.Gaussian elimination (simple,partial pivot and total pivot)]
[2.Iterative methods Jacobi-Gauss-Seidel]
[3.Iterative methods SOR)]


For Case of study #3 you will find the following methods for interpolation:

[1.Vandermonde]
[2.Newton (Divided difference method)]
[3.Spline (linear, square and cubic)]
