hold on;
axis equal;
xlim([-10 20]);
ylim([-10 10]);

%LAS LONGITUDES DE LAS BARRAS SE PUEDE MODIFICAR SIEMPRE Y CUANDO SEA GRASHOF. 
%Estas son longitudes sugeridas para realizar pruebas
a=3; %longitud de la primera barra
b=8;  %Longitud de la segunda barra
c=8;  %Longitud de la tercera barra
d=12;  %Longitud de la base
a= input('Ingrese un valor para la primera barra');
b= input('Ingrese un valor para la segunda barra');
c= input('Ingrese un valor para la tercera barra');
d= input('Ingrese un valor para la base');

t=0 %angulo de tetha 1 A

P=5; %Altura del triangulo
anP=60*pi/180; %Angulo de el triangulo 
k=1; %Movimiento para k


r1=zeros(2,4);  %coordenadas 2,4 es donde va a empezar la longitud de la base 
r1(4,1)=d;      %Coordenadas 4,1 es donde se va a llenar 

while t<=2*pi
cla

r1(2,1)=a*cos(t); %El punto B coordenada x, donde se va a empezar se va a unir la barra a la barra b
r1(2,2)=a*sin(t); %El punto B coordenada y, donde se va a empezar se va a unir la barra a la barra b

%UTILIZAMOS LA LEY DE SENOS Y COSENOS.
h=sqrt(a^2+d^2-2*a*d*cos(t));    %Barra de manivela de corredera
t2=acos((b^2-h^2-c^2)/(-2*h*c)); %angulo de tetha 2 B
t3=asin(a*sin(t)/h);             %angulo de tetha 3 C
t4=(pi-(t2+t3));                 %angulo de tetha 4 D
t5=acos((c^2-h^2-b^2)/(-2*h*b)); %
t6=t5-t3;                        %
T=anP+t6                         %

r1(3,1)=d+c*cos(t4); %Longitud del movimiento de la barra c
r1(3,2)=c*sin(t4);   %Longitud del movimiento de la barra c 

Px=cos(T)*P+a*cos(t); %Movimiento en x para la barra c
Py=sin(T)*P+a*sin(t); %Movimiento en y para la barra c

x1=[a*cos(t) Px]; %coordenadas de ubicacion en x para el plot para la barra izquierda del triangulo.
y1=[a*sin(t) Py]; %Coordenadas de ubicacion en y para el plot para la barra izquierda del triangulo.

x2=[Px r1(3,1)];  %Coordenadas de ubicacion en x para el plot para la barra derecha del triangulo.
y2=[Py r1(3,2)];  %Coordenadas de ubicacion en y para el plot para la barra derecha del triangulo.

x3(k)=Px;         %Se utiliza para el movimiento
y3(k)=Py;         %Se utiliza para el movimiento



plot(x3,y3,'-r');
plot(x2,y2,'-g'); %Dibujo de x,y de la barra derecha   
plot(x1,y1,'-ob');%Dibujo de x,y de la barra izquierda triangulo.
plot(r1(:,1),r1(:,2),'-black') %Dibuja el resto de la figura

%pause(.1);
%t=t+pi/30;
%k=k+1;


drawnow;
t=t+pi/200; 
k=k+1;      
end    