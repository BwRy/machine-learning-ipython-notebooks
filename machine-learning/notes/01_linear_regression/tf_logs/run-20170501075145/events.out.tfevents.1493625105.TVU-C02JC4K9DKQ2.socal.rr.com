       �K"	  @D�A�Abrain.Event:2&�bC�      [ z	�qD�A�A"�=
S
XPlaceholder*'
_output_shapes
:���������	*
shape: *
dtype0
S
yPlaceholder*'
_output_shapes
:���������*
shape: *
dtype0
e
random_uniform/shapeConst*
valueB"	      *
_output_shapes
:*
dtype0
W
random_uniform/minConst*
valueB
 *  ��*
_output_shapes
: *
dtype0
W
random_uniform/maxConst*
valueB
 *  �?*
_output_shapes
: *
dtype0
�
random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
_output_shapes

:	*
seed2**
seed���)*
dtype0*
T0
b
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0*
_output_shapes
: 
t
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0*
_output_shapes

:	
f
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0*
_output_shapes

:	
y
theta
VariableV2*
_output_shapes

:	*
shared_name *
shape
:	*
dtype0*
	container 
�
theta/AssignAssignthetarandom_uniform*
validate_shape(*
_class

loc:@theta*
T0*
_output_shapes

:	*
use_locking(
`

theta/readIdentitytheta*
_class

loc:@theta*
T0*
_output_shapes

:	
|
predictionsMatMulX
theta/read*
transpose_b( *
transpose_a( *'
_output_shapes
:���������*
T0
Q
loss/subSubpredictionsy*
T0*'
_output_shapes
:���������
Q
loss/SquareSquareloss/sub*
T0*'
_output_shapes
:���������
[

loss/ConstConst*
valueB"       *
_output_shapes
:*
dtype0
g
loss/mseMeanloss/Square
loss/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
R
gradients/ShapeConst*
valueB *
_output_shapes
: *
dtype0
T
gradients/ConstConst*
valueB
 *  �?*
_output_shapes
: *
dtype0
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
v
%gradients/loss/mse_grad/Reshape/shapeConst*
valueB"      *
_output_shapes
:*
dtype0
�
gradients/loss/mse_grad/ReshapeReshapegradients/Fill%gradients/loss/mse_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes

:
h
gradients/loss/mse_grad/ShapeShapeloss/Square*
out_type0*
T0*
_output_shapes
:
�
gradients/loss/mse_grad/TileTilegradients/loss/mse_grad/Reshapegradients/loss/mse_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:���������
j
gradients/loss/mse_grad/Shape_1Shapeloss/Square*
out_type0*
T0*
_output_shapes
:
b
gradients/loss/mse_grad/Shape_2Const*
valueB *
_output_shapes
: *
dtype0
g
gradients/loss/mse_grad/ConstConst*
valueB: *
_output_shapes
:*
dtype0
�
gradients/loss/mse_grad/ProdProdgradients/loss/mse_grad/Shape_1gradients/loss/mse_grad/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
i
gradients/loss/mse_grad/Const_1Const*
valueB: *
_output_shapes
:*
dtype0
�
gradients/loss/mse_grad/Prod_1Prodgradients/loss/mse_grad/Shape_2gradients/loss/mse_grad/Const_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
c
!gradients/loss/mse_grad/Maximum/yConst*
value	B :*
_output_shapes
: *
dtype0
�
gradients/loss/mse_grad/MaximumMaximumgradients/loss/mse_grad/Prod_1!gradients/loss/mse_grad/Maximum/y*
T0*
_output_shapes
: 
�
 gradients/loss/mse_grad/floordivFloorDivgradients/loss/mse_grad/Prodgradients/loss/mse_grad/Maximum*
T0*
_output_shapes
: 
v
gradients/loss/mse_grad/CastCast gradients/loss/mse_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
gradients/loss/mse_grad/truedivRealDivgradients/loss/mse_grad/Tilegradients/loss/mse_grad/Cast*
T0*'
_output_shapes
:���������
�
 gradients/loss/Square_grad/mul/xConst ^gradients/loss/mse_grad/truediv*
valueB
 *   @*
_output_shapes
: *
dtype0
�
gradients/loss/Square_grad/mulMul gradients/loss/Square_grad/mul/xloss/sub*
T0*'
_output_shapes
:���������
�
 gradients/loss/Square_grad/mul_1Mulgradients/loss/mse_grad/truedivgradients/loss/Square_grad/mul*
T0*'
_output_shapes
:���������
h
gradients/loss/sub_grad/ShapeShapepredictions*
out_type0*
T0*
_output_shapes
:
`
gradients/loss/sub_grad/Shape_1Shapey*
out_type0*
T0*
_output_shapes
:
�
-gradients/loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/loss/sub_grad/Shapegradients/loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
gradients/loss/sub_grad/SumSum gradients/loss/Square_grad/mul_1-gradients/loss/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
�
gradients/loss/sub_grad/ReshapeReshapegradients/loss/sub_grad/Sumgradients/loss/sub_grad/Shape*
Tshape0*
T0*'
_output_shapes
:���������
�
gradients/loss/sub_grad/Sum_1Sum gradients/loss/Square_grad/mul_1/gradients/loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
d
gradients/loss/sub_grad/NegNeggradients/loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
!gradients/loss/sub_grad/Reshape_1Reshapegradients/loss/sub_grad/Neggradients/loss/sub_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:���������
v
(gradients/loss/sub_grad/tuple/group_depsNoOp ^gradients/loss/sub_grad/Reshape"^gradients/loss/sub_grad/Reshape_1
�
0gradients/loss/sub_grad/tuple/control_dependencyIdentitygradients/loss/sub_grad/Reshape)^gradients/loss/sub_grad/tuple/group_deps*2
_class(
&$loc:@gradients/loss/sub_grad/Reshape*
T0*'
_output_shapes
:���������
�
2gradients/loss/sub_grad/tuple/control_dependency_1Identity!gradients/loss/sub_grad/Reshape_1)^gradients/loss/sub_grad/tuple/group_deps*4
_class*
(&loc:@gradients/loss/sub_grad/Reshape_1*
T0*'
_output_shapes
:���������
�
!gradients/predictions_grad/MatMulMatMul0gradients/loss/sub_grad/tuple/control_dependency
theta/read*
transpose_b(*
transpose_a( *'
_output_shapes
:���������	*
T0
�
#gradients/predictions_grad/MatMul_1MatMulX0gradients/loss/sub_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
_output_shapes

:	*
T0
}
+gradients/predictions_grad/tuple/group_depsNoOp"^gradients/predictions_grad/MatMul$^gradients/predictions_grad/MatMul_1
�
3gradients/predictions_grad/tuple/control_dependencyIdentity!gradients/predictions_grad/MatMul,^gradients/predictions_grad/tuple/group_deps*4
_class*
(&loc:@gradients/predictions_grad/MatMul*
T0*'
_output_shapes
:���������	
�
5gradients/predictions_grad/tuple/control_dependency_1Identity#gradients/predictions_grad/MatMul_1,^gradients/predictions_grad/tuple/group_deps*6
_class,
*(loc:@gradients/predictions_grad/MatMul_1*
T0*
_output_shapes

:	
b
GradientDescent/learning_rateConst*
valueB
 *
�#<*
_output_shapes
: *
dtype0
�
1GradientDescent/update_theta/ApplyGradientDescentApplyGradientDescentthetaGradientDescent/learning_rate5gradients/predictions_grad/tuple/control_dependency_1*
_class

loc:@theta*
T0*
_output_shapes

:	*
use_locking( 
K
GradientDescentNoOp2^GradientDescent/update_theta/ApplyGradientDescent

initNoOp^theta/Assign
L
MSE/tagsConst*
valueB	 BMSE*
_output_shapes
: *
dtype0
I
MSEScalarSummaryMSE/tagsloss/mse*
T0*
_output_shapes
: "���Im(      aoB�	�1tD�A�AJ�P
��
9
Add
x"T
y"T
z"T"
Ttype:
2	
�
ApplyGradientDescent
var"T�

alpha"T

delta"T
out"T�"
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
.
Identity

input"T
output"T"	
Ttype
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	�
�
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	�
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
A
Placeholder
output"dtype"
dtypetype"
shapeshape: 
�
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
0
Square
x"T
y"T"
Ttype:
	2	
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
�
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �*1.1.02v1.1.0-rc0-61-g1ec6ed5�=
S
XPlaceholder*
dtype0*
shape: *'
_output_shapes
:���������	
S
yPlaceholder*
dtype0*
shape: *'
_output_shapes
:���������
e
random_uniform/shapeConst*
valueB"	      *
dtype0*
_output_shapes
:
W
random_uniform/minConst*
valueB
 *  ��*
dtype0*
_output_shapes
: 
W
random_uniform/maxConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
�
random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
seed2**
dtype0*
seed���)*
_output_shapes

:	*
T0
b
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0*
_output_shapes
: 
t
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0*
_output_shapes

:	
f
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0*
_output_shapes

:	
y
theta
VariableV2*
shared_name *
dtype0*
shape
:	*
_output_shapes

:	*
	container 
�
theta/AssignAssignthetarandom_uniform*
validate_shape(*
_class

loc:@theta*
T0*
_output_shapes

:	*
use_locking(
`

theta/readIdentitytheta*
_class

loc:@theta*
T0*
_output_shapes

:	
|
predictionsMatMulX
theta/read*
transpose_b( *
transpose_a( *'
_output_shapes
:���������*
T0
Q
loss/subSubpredictionsy*
T0*'
_output_shapes
:���������
Q
loss/SquareSquareloss/sub*
T0*'
_output_shapes
:���������
[

loss/ConstConst*
valueB"       *
dtype0*
_output_shapes
:
g
loss/mseMeanloss/Square
loss/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
R
gradients/ShapeConst*
valueB *
dtype0*
_output_shapes
: 
T
gradients/ConstConst*
valueB
 *  �?*
dtype0*
_output_shapes
: 
Y
gradients/FillFillgradients/Shapegradients/Const*
T0*
_output_shapes
: 
v
%gradients/loss/mse_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
�
gradients/loss/mse_grad/ReshapeReshapegradients/Fill%gradients/loss/mse_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes

:
h
gradients/loss/mse_grad/ShapeShapeloss/Square*
out_type0*
T0*
_output_shapes
:
�
gradients/loss/mse_grad/TileTilegradients/loss/mse_grad/Reshapegradients/loss/mse_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:���������
j
gradients/loss/mse_grad/Shape_1Shapeloss/Square*
out_type0*
T0*
_output_shapes
:
b
gradients/loss/mse_grad/Shape_2Const*
valueB *
dtype0*
_output_shapes
: 
g
gradients/loss/mse_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
gradients/loss/mse_grad/ProdProdgradients/loss/mse_grad/Shape_1gradients/loss/mse_grad/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
i
gradients/loss/mse_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
�
gradients/loss/mse_grad/Prod_1Prodgradients/loss/mse_grad/Shape_2gradients/loss/mse_grad/Const_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
c
!gradients/loss/mse_grad/Maximum/yConst*
value	B :*
dtype0*
_output_shapes
: 
�
gradients/loss/mse_grad/MaximumMaximumgradients/loss/mse_grad/Prod_1!gradients/loss/mse_grad/Maximum/y*
T0*
_output_shapes
: 
�
 gradients/loss/mse_grad/floordivFloorDivgradients/loss/mse_grad/Prodgradients/loss/mse_grad/Maximum*
T0*
_output_shapes
: 
v
gradients/loss/mse_grad/CastCast gradients/loss/mse_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
gradients/loss/mse_grad/truedivRealDivgradients/loss/mse_grad/Tilegradients/loss/mse_grad/Cast*
T0*'
_output_shapes
:���������
�
 gradients/loss/Square_grad/mul/xConst ^gradients/loss/mse_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
�
gradients/loss/Square_grad/mulMul gradients/loss/Square_grad/mul/xloss/sub*
T0*'
_output_shapes
:���������
�
 gradients/loss/Square_grad/mul_1Mulgradients/loss/mse_grad/truedivgradients/loss/Square_grad/mul*
T0*'
_output_shapes
:���������
h
gradients/loss/sub_grad/ShapeShapepredictions*
out_type0*
T0*
_output_shapes
:
`
gradients/loss/sub_grad/Shape_1Shapey*
out_type0*
T0*
_output_shapes
:
�
-gradients/loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/loss/sub_grad/Shapegradients/loss/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
gradients/loss/sub_grad/SumSum gradients/loss/Square_grad/mul_1-gradients/loss/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
�
gradients/loss/sub_grad/ReshapeReshapegradients/loss/sub_grad/Sumgradients/loss/sub_grad/Shape*
Tshape0*
T0*'
_output_shapes
:���������
�
gradients/loss/sub_grad/Sum_1Sum gradients/loss/Square_grad/mul_1/gradients/loss/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
d
gradients/loss/sub_grad/NegNeggradients/loss/sub_grad/Sum_1*
T0*
_output_shapes
:
�
!gradients/loss/sub_grad/Reshape_1Reshapegradients/loss/sub_grad/Neggradients/loss/sub_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:���������
v
(gradients/loss/sub_grad/tuple/group_depsNoOp ^gradients/loss/sub_grad/Reshape"^gradients/loss/sub_grad/Reshape_1
�
0gradients/loss/sub_grad/tuple/control_dependencyIdentitygradients/loss/sub_grad/Reshape)^gradients/loss/sub_grad/tuple/group_deps*2
_class(
&$loc:@gradients/loss/sub_grad/Reshape*
T0*'
_output_shapes
:���������
�
2gradients/loss/sub_grad/tuple/control_dependency_1Identity!gradients/loss/sub_grad/Reshape_1)^gradients/loss/sub_grad/tuple/group_deps*4
_class*
(&loc:@gradients/loss/sub_grad/Reshape_1*
T0*'
_output_shapes
:���������
�
!gradients/predictions_grad/MatMulMatMul0gradients/loss/sub_grad/tuple/control_dependency
theta/read*
transpose_b(*
transpose_a( *'
_output_shapes
:���������	*
T0
�
#gradients/predictions_grad/MatMul_1MatMulX0gradients/loss/sub_grad/tuple/control_dependency*
transpose_b( *
transpose_a(*
_output_shapes

:	*
T0
}
+gradients/predictions_grad/tuple/group_depsNoOp"^gradients/predictions_grad/MatMul$^gradients/predictions_grad/MatMul_1
�
3gradients/predictions_grad/tuple/control_dependencyIdentity!gradients/predictions_grad/MatMul,^gradients/predictions_grad/tuple/group_deps*4
_class*
(&loc:@gradients/predictions_grad/MatMul*
T0*'
_output_shapes
:���������	
�
5gradients/predictions_grad/tuple/control_dependency_1Identity#gradients/predictions_grad/MatMul_1,^gradients/predictions_grad/tuple/group_deps*6
_class,
*(loc:@gradients/predictions_grad/MatMul_1*
T0*
_output_shapes

:	
b
GradientDescent/learning_rateConst*
valueB
 *
�#<*
dtype0*
_output_shapes
: 
�
1GradientDescent/update_theta/ApplyGradientDescentApplyGradientDescentthetaGradientDescent/learning_rate5gradients/predictions_grad/tuple/control_dependency_1*
_class

loc:@theta*
T0*
_output_shapes

:	*
use_locking( 
K
GradientDescentNoOp2^GradientDescent/update_theta/ApplyGradientDescent

initNoOp^theta/Assign
L
MSE/tagsConst*
valueB	 BMSE*
dtype0*
_output_shapes
: 
I
MSEScalarSummaryMSE/tagsloss/mse*
T0*
_output_shapes
: ""
train_op

GradientDescent"6
	variables)'
%
theta:0theta/Assigntheta/read:0"@
trainable_variables)'
%
theta:0theta/Assigntheta/read:0"
	summaries	

MSE:0u�̀       ���	�jF�A�A*


MSEN~@Nw�       ��(	a�F�A�A
*


MSE;�?���       ��(	�'F�A�A*


MSE�ؚ?���|       ��(	�jF�A�A*


MSEW,U?I�xX       ��(	�F�A�A(*


MSEʗ�?L~\�       ��(	�F�A�A2*


MSE.k?�$��       ��(	�/F�A�A<*


MSE��:?Ѹ~       ��(	oF�A�AF*


MSE�!?��*       ��(	�F�A�AP*


MSExK'?&��       ��(	9�F�A�AZ*


MSE.�&?��rj       ��(	�3F�A�Ad*


MSE�oT?$9�f       ��(	CtF�A�An*


MSE�f?�7N}       ��(	�F�A�Ax*


MSE${�>�=��       ��-	��F�A�A�*


MSE&�?��]9       ��-	v6F�A�A�*


MSE�U�>&��       ��-	��F�A�A�*


MSEED*?88�       ��-	@�F�A�A�*


MSE;�>.S�       ��-	�RF�A�A�*


MSE���>h%8       ��-	R�F�A�A�*


MSE\�]?AxT       ��-	I�F�A�A�*


MSED%?����       ��-	6F�A�A�*


MSER��>�=��       ��-	MF�A�A�*


MSE*�9?�pv�       ��-	L�F�A�A�*


MSE��>���       ��-	7�F�A�A�*


MSE��>Wdj=       ��-		F�A�A�*


MSEJU�>&�       ��-	�@	F�A�A�*


MSE�
?��r       ��-	�	F�A�A�*


MSEl)�>`�%�       ��-	��	F�A�A�*


MSE�O�>� �1       ��-	T6
F�A�A�*


MSE��>|�^       ��-	�r
F�A�A�*


MSE��	?�0:       ��-	��
F�A�A�*


MSE���>�P�       ��-	t�
F�A�A�*


MSE�1!?
�P       ��-	�&F�A�A�*


MSE�R�>�lb       ��-	p`F�A�A�*


MSE_�>���       ��-	�F�A�A�*


MSE��?�G�       ��-	��F�A�A�*


MSE���>�F       ��-	xF�A�A�*


MSE�!?zC�       ��-	oJF�A�A�*


MSE��?�A        ��-	��F�A�A�*


MSE��?k��       ��-	��F�A�A�*


MSE�0?��(�       ��-	�F�A�A�*


MSE��>&2       ��-	a2F�A�A�*


MSE�?ru~�       ��-	t]F�A�A�*


MSE�{?�X��       ��-	F�F�A�A�*


MSE��?F$�L       ��-	��F�A�A�*


MSE���>�Y<�       ��-	�F�A�A�*


MSE��? 8�a       ��-	�EF�A�A�*


MSEe�>h��       ��-	�F�A�A�*


MSE�3?���       ��-	�F�A�A�*


MSEڻ+?��ݦ       ��-	s�F�A�A�*


MSE�m=?hz��       ��-	�2F�A�A�*


MSE�w!?��,       ��-	alF�A�A�*


MSE7��>��G�       ��-	��F�A�A�*


MSE���>�:h�       ��-	v�F�A�A�*


MSE��?��Պ       ��-	F�A�A�*


MSEI�?�~       ��-	�VF�A�A�*


MSEԪH?����       ��-	W�F�A�A�*


MSE�?��>�       ��-	��F�A�A�*


MSE.��>ϠA       ��-	kF�A�A�*


MSE�=?4��       ��-	OF�A�A�*


MSEX�?�{��       ��-	�F�A�A�*


MSEZ�?���       ��-	
�F�A�A�*


MSE���>�ǒ5       ��-	�F�A�A�*


MSE�?�       ��-	{MF�A�A�*


MSE���>��y       ��-	��F�A�A�*


MSE�(�>����       ��-	�F�A�A�*


MSE!QE?��-       ��-	2�F�A�A�*


MSE)?E5w!       ��-	�8F�A�A�*


MSE���>�zw       ��-	:wF�A�A�*


MSEq:�>N;�       ��-	��F�A�A�*


MSE��>Д2�       ��-	��F�A�A�*


MSE{�>!�h�       ��-	�,F�A�A�*


MSE�ۦ>�3        ��-	hF�A�A�*


MSE�(?�t>�       ��-	^�F�A�A�*


MSEeӟ>1�cH       ��-	��F�A�A�*


MSE��>1��       ��-	` F�A�A�*


MSE��>,O47       ��-	�ZF�A�A�*


MSE��=?l���       ��-	��F�A�A�*


MSE�o�>6h~       ��-	F�F�A�A�*


MSE�2?�{=�       ��-	�	F�A�A�*


MSE�~??g��       ��-	�EF�A�A�*


MSE�~�>8��       ��-	��F�A�A�*


MSE��4?����       ��-	úF�A�A�*


MSE�Z?1�       ��-	4�F�A�A�*


MSE.i�>��S       ��-	 F�A�A�*


MSE�N?t�q�       ��-	�ZF�A�A�*


MSEop�>�mv       ��-	u�F�A�A�*


MSE(x�>oN\       ��-	 �F�A�A�*


MSE�>�y�       ��-	p
F�A�A�*


MSEF��>5Q��       ��-	gCF�A�A�*


MSE�@�>���       ��-	�|F�A�A�*


MSE�>���A       ��-	1�F�A�A�*


MSE�r?��z       ��-	��F�A�A�*


MSE��>C��       ��-	�'F�A�A�*


MSE�l�>GND       ��-	fF�A�A�*


MSE��4?��=       ��-	c�F�A�A�*


MSE��?Z��       ��-	mF�A�A�*


MSE�}?\�]       ��-	>F�A�A�*


MSE��?1��       ��-	[xF�A�A�*


MSE*}�>����       ��-	̲F�A�A�*


MSE�&?+�       ��-	5�F�A�A�*


MSEc%�>�\�       ��-	B&F�A�A�*


MSE\��>�p�       ��-	�`F�A�A�*


MSE�	?bwC�       ��-	ٙF�A�A�*


MSE�?}�"f       ��-	t�F�A�A�*


MSE\��>l}p�       ��-	��F�A�A�*


MSE��D?k-�4       ��-		8F�A�A�*


MSEG?"?���d       ��-	�qF�A�A�*


MSE�y?���       ��-	ѭF�A�A�*


MSE���>~D�       ��-	X�F�A�A�*


MSEȆ�>���        ��-	� F�A�A�*


MSE!�?v�J�       ��-	�ZF�A�A�*


MSEf��>�O�       ��-	1�F�A�A�*


MSEA�>BM-x       ��-	��F�A�A�*


MSE�
?D�dI       ��-		F�A�A�*


MSE�??/��)       ��-	(CF�A�A�*


MSE�$?��[X       ��-	R|F�A�A�*


MSE�<�>�-WV       ��-	�F�A�A�	*


MSE��>�}�S       ��-	g�F�A�A�	*


MSEߞ�>.�j       ��-	*F�A�A�	*


MSE�
�>�z       ��-	5cF�A�A�	*


MSE�/�>=�       ��-	b�F�A�A�	*


MSE�0?��H�       ��-	4�F�A�A�	*


MSE�*?$�j�       ��-	8 F�A�A�	*


MSE��?�o�       ��-	�J F�A�A�	*


MSE�?蒗�       ��-	#� F�A�A�	*


MSE�5-?b��Y       ��-	�� F�A�A�	*


MSE�(4?=Wx       ��-	�� F�A�A�	*


MSEʥ�>���       ��-	F&!F�A�A�	*


MSEd�?�L�       ��-	5`!F�A�A�	*


MSE/��>�aq�       ��-	�!F�A�A�
*


MSEf�&?��Hu       ��-	��!F�A�A�
*


MSE�:?B���       ��-	�"F�A�A�
*


MSE�F?dj��       ��-	�K"F�A�A�
*


MSE� ?�/n�       ��-	��"F�A�A�
*


MSE_ȩ>�uy>       ��-	8�"F�A�A�
*


MSE?�?��$�       ��-	?�"F�A�A�
*


MSE�S?G��       ��-	�=#F�A�A�
*


MSE��2?����       ��-	�{#F�A�A�
*


MSE�?��Y       ��-	�#F�A�A�
*


MSE�	?��R�       ��-	5�#F�A�A�
*


MSER�6?	h�@       ��-	#0$F�A�A�
*


MSE��?m���       ��-	Uk$F�A�A�
*


MSE] ?i-h3       ��-	��$F�A�A�*


MSEmlJ?��`�       ��-	m�$F�A�A�*


MSE�g?3[^"       ��-	�%F�A�A�*


MSE��G?.�       ��-	�X%F�A�A�*


MSE$�>{v       ��-	Z�%F�A�A�*


MSEJ�>a��       ��-	&�%F�A�A�*


MSE<�#?i�h�       ��-	�&F�A�A�*


MSEa=�>��x       ��-	L&F�A�A�*


MSE#.?�5
       ��-	��&F�A�A�*


MSEZP�>S���       ��-	��&F�A�A�*


MSE���>��v       ��-	�'F�A�A�*


MSE;��>�5�       ��-	�>'F�A�A�*


MSE�6�>�[C�       ��-	�{'F�A�A�*


MSE�z�>
;��       ��-	�'F�A�A�*


MSE�f�>�k
       ��-	��'F�A�A�*


MSEVm=?�A�       ��-	�,(F�A�A�*


MSE�<
?	a�       ��-	�m(F�A�A�*


MSE��>D�H       ��-	��(F�A�A�*


MSEhQ�>��%�       ��-	��(F�A�A�*


MSE.
?r}�d       ��-	�)F�A�A�*


MSE�T�>��e       ��-	�U)F�A�A�*


MSEiP?��XD       ��-	)�)F�A�A�*


MSE�V?�h-�       ��-	Y�)F�A�A�*


MSEdc0?3ʦ�       ��-	]7*F�A�A�*


MSE!h!?,s��       ��-	\q*F�A�A�*


MSEL?i�u       ��-	A�*F�A�A�*


MSEs=�>�8r�       ��-	Y�*F�A�A�*


MSE,*?���+       ��-	�+F�A�A�*


MSE=� ?��R�       ��-	�P+F�A�A�*


MSE&&�>לh�       ��-	Ҋ+F�A�A�*


MSEe�?�"�       ��-	��+F�A�A�*


MSEm�!?�f�       ��-	�,F�A�A�*


MSE��>?�|nb       ��-	[A,F�A�A�*


MSE�p?�C�       ��-	�z,F�A�A�*


MSE���>ӿl�       ��-	|�,F�A�A�*


MSEn�?� �       ��-	��,F�A�A�*


MSE.� ?�C�       ��-	/-F�A�A�*


MSE��?�D�A       ��-	/k-F�A�A�*


MSET�?G���       ��-	��-F�A�A�*


MSE�D�>����       ��-	��-F�A�A�*


MSEOI?�ƍ       ��-	�.F�A�A�*


MSE{�
? �       ��-	Z.F�A�A�*


MSE)�>���O       ��-	l�.F�A�A�*


MSE�#�>���p       ��-	��.F�A�A�*


MSE.��>us�e       ��-	F/F�A�A�*


MSE���>S1}       ��-	kF/F�A�A�*


MSE�<?�>�e       ��-	&q/F�A�A�*


MSE(G�> ��       ��-	��/F�A�A�*


MSEZ�>w>       ��-	��/F�A�A�*


MSE�
?���       ��-	�0F�A�A�*


MSE��>o�&       ��-	[^0F�A�A�*


MSE�X�>�R�L       ��-	��0F�A�A�*


MSE�#�>�b,x       ��-	|�0F�A�A�*


MSE�?>��y       ��-	,1F�A�A�*


MSEܟ�>�"��       ��-	4H1F�A�A�*


MSE*?��2       ��-	4�1F�A�A�*


MSE�,?�U�       ��-	��1F�A�A�*


MSE�
?Y�$�       ��-	+�1F�A�A�*


MSE�0�>��8"       ��-	�02F�A�A�*


MSE�&?2q��       ��-	nj2F�A�A�*


MSE�y?ճqA       ��-	Ӥ2F�A�A�*


MSE=�>�-�       ��-	��2F�A�A�*


MSE͛�>�&�       ��-	�3F�A�A�*


MSE�x?�㽂       ��-	�V3F�A�A�*


MSE_|�>�~;       ��-	\�3F�A�A�*


MSE\%�>+]       ��-	�3F�A�A�*


MSE�%�>�z��       ��-	�4F�A�A�*


MSEz?���}