       �K"	   y�A�Abrain.Event:2$���S      ����	ʦy�A�A"�:
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
L
subSubpredictionsy*
T0*'
_output_shapes
:���������
G
SquareSquaresub*
T0*'
_output_shapes
:���������
V
ConstConst*
valueB"       *
_output_shapes
:*
dtype0
X
mseMeanSquareConst*

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
q
 gradients/mse_grad/Reshape/shapeConst*
valueB"      *
_output_shapes
:*
dtype0
�
gradients/mse_grad/ReshapeReshapegradients/Fill gradients/mse_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes

:
^
gradients/mse_grad/ShapeShapeSquare*
out_type0*
T0*
_output_shapes
:
�
gradients/mse_grad/TileTilegradients/mse_grad/Reshapegradients/mse_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:���������
`
gradients/mse_grad/Shape_1ShapeSquare*
out_type0*
T0*
_output_shapes
:
]
gradients/mse_grad/Shape_2Const*
valueB *
_output_shapes
: *
dtype0
b
gradients/mse_grad/ConstConst*
valueB: *
_output_shapes
:*
dtype0
�
gradients/mse_grad/ProdProdgradients/mse_grad/Shape_1gradients/mse_grad/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
d
gradients/mse_grad/Const_1Const*
valueB: *
_output_shapes
:*
dtype0
�
gradients/mse_grad/Prod_1Prodgradients/mse_grad/Shape_2gradients/mse_grad/Const_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
^
gradients/mse_grad/Maximum/yConst*
value	B :*
_output_shapes
: *
dtype0

gradients/mse_grad/MaximumMaximumgradients/mse_grad/Prod_1gradients/mse_grad/Maximum/y*
T0*
_output_shapes
: 
}
gradients/mse_grad/floordivFloorDivgradients/mse_grad/Prodgradients/mse_grad/Maximum*
T0*
_output_shapes
: 
l
gradients/mse_grad/CastCastgradients/mse_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
gradients/mse_grad/truedivRealDivgradients/mse_grad/Tilegradients/mse_grad/Cast*
T0*'
_output_shapes
:���������
}
gradients/Square_grad/mul/xConst^gradients/mse_grad/truediv*
valueB
 *   @*
_output_shapes
: *
dtype0
t
gradients/Square_grad/mulMulgradients/Square_grad/mul/xsub*
T0*'
_output_shapes
:���������
�
gradients/Square_grad/mul_1Mulgradients/mse_grad/truedivgradients/Square_grad/mul*
T0*'
_output_shapes
:���������
c
gradients/sub_grad/ShapeShapepredictions*
out_type0*
T0*
_output_shapes
:
[
gradients/sub_grad/Shape_1Shapey*
out_type0*
T0*
_output_shapes
:
�
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
gradients/sub_grad/SumSumgradients/Square_grad/mul_1(gradients/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
�
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
Tshape0*
T0*'
_output_shapes
:���������
�
gradients/sub_grad/Sum_1Sumgradients/Square_grad/mul_1*gradients/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0*
_output_shapes
:
�
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:���������
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
�
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*-
_class#
!loc:@gradients/sub_grad/Reshape*
T0*'
_output_shapes
:���������
�
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*
T0*'
_output_shapes
:���������
�
!gradients/predictions_grad/MatMulMatMul+gradients/sub_grad/tuple/control_dependency
theta/read*
transpose_b(*
transpose_a( *'
_output_shapes
:���������	*
T0
�
#gradients/predictions_grad/MatMul_1MatMulX+gradients/sub_grad/tuple/control_dependency*
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
D
MSEScalarSummaryMSE/tagsmse*
T0*
_output_shapes
: "�,"��&      Q*^�	��y�A�AJ�M
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
shared_namestring �*1.1.02v1.1.0-rc0-61-g1ec6ed5�:
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
L
subSubpredictionsy*
T0*'
_output_shapes
:���������
G
SquareSquaresub*
T0*'
_output_shapes
:���������
V
ConstConst*
valueB"       *
dtype0*
_output_shapes
:
X
mseMeanSquareConst*

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
q
 gradients/mse_grad/Reshape/shapeConst*
valueB"      *
dtype0*
_output_shapes
:
�
gradients/mse_grad/ReshapeReshapegradients/Fill gradients/mse_grad/Reshape/shape*
Tshape0*
T0*
_output_shapes

:
^
gradients/mse_grad/ShapeShapeSquare*
out_type0*
T0*
_output_shapes
:
�
gradients/mse_grad/TileTilegradients/mse_grad/Reshapegradients/mse_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:���������
`
gradients/mse_grad/Shape_1ShapeSquare*
out_type0*
T0*
_output_shapes
:
]
gradients/mse_grad/Shape_2Const*
valueB *
dtype0*
_output_shapes
: 
b
gradients/mse_grad/ConstConst*
valueB: *
dtype0*
_output_shapes
:
�
gradients/mse_grad/ProdProdgradients/mse_grad/Shape_1gradients/mse_grad/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
d
gradients/mse_grad/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
�
gradients/mse_grad/Prod_1Prodgradients/mse_grad/Shape_2gradients/mse_grad/Const_1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
^
gradients/mse_grad/Maximum/yConst*
value	B :*
dtype0*
_output_shapes
: 

gradients/mse_grad/MaximumMaximumgradients/mse_grad/Prod_1gradients/mse_grad/Maximum/y*
T0*
_output_shapes
: 
}
gradients/mse_grad/floordivFloorDivgradients/mse_grad/Prodgradients/mse_grad/Maximum*
T0*
_output_shapes
: 
l
gradients/mse_grad/CastCastgradients/mse_grad/floordiv*

SrcT0*
_output_shapes
: *

DstT0
�
gradients/mse_grad/truedivRealDivgradients/mse_grad/Tilegradients/mse_grad/Cast*
T0*'
_output_shapes
:���������
}
gradients/Square_grad/mul/xConst^gradients/mse_grad/truediv*
valueB
 *   @*
dtype0*
_output_shapes
: 
t
gradients/Square_grad/mulMulgradients/Square_grad/mul/xsub*
T0*'
_output_shapes
:���������
�
gradients/Square_grad/mul_1Mulgradients/mse_grad/truedivgradients/Square_grad/mul*
T0*'
_output_shapes
:���������
c
gradients/sub_grad/ShapeShapepredictions*
out_type0*
T0*
_output_shapes
:
[
gradients/sub_grad/Shape_1Shapey*
out_type0*
T0*
_output_shapes
:
�
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*
T0*2
_output_shapes 
:���������:���������
�
gradients/sub_grad/SumSumgradients/Square_grad/mul_1(gradients/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
�
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
Tshape0*
T0*'
_output_shapes
:���������
�
gradients/sub_grad/Sum_1Sumgradients/Square_grad/mul_1*gradients/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*
_output_shapes
:
Z
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0*
_output_shapes
:
�
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
Tshape0*
T0*'
_output_shapes
:���������
g
#gradients/sub_grad/tuple/group_depsNoOp^gradients/sub_grad/Reshape^gradients/sub_grad/Reshape_1
�
+gradients/sub_grad/tuple/control_dependencyIdentitygradients/sub_grad/Reshape$^gradients/sub_grad/tuple/group_deps*-
_class#
!loc:@gradients/sub_grad/Reshape*
T0*'
_output_shapes
:���������
�
-gradients/sub_grad/tuple/control_dependency_1Identitygradients/sub_grad/Reshape_1$^gradients/sub_grad/tuple/group_deps*/
_class%
#!loc:@gradients/sub_grad/Reshape_1*
T0*'
_output_shapes
:���������
�
!gradients/predictions_grad/MatMulMatMul+gradients/sub_grad/tuple/control_dependency
theta/read*
transpose_b(*
transpose_a( *'
_output_shapes
:���������	*
T0
�
#gradients/predictions_grad/MatMul_1MatMulX+gradients/sub_grad/tuple/control_dependency*
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
D
MSEScalarSummaryMSE/tagsmse*
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
MSE:0�nI       ���	�-�z�A�A*


MSEN~@��7       ��(	x��z�A�A
*


MSE;�?����       ��(	��z�A�A*


MSE�ؚ?�ܗ�       ��(	%�z�A�A*


MSEW,U?Pt�V       ��(	0b�z�A�A(*


MSEʗ�?��_�       ��(	���z�A�A2*


MSE.k?���       ��(	�ڵz�A�A<*


MSE��:?!��       ��(	�z�A�AF*


MSE�!?��g       ��(	^�z�A�AP*


MSExK'?A�p       ��(	4��z�A�AZ*


MSE.�&?Tn�M       ��(	0�z�A�Ad*


MSE�oT?n+       ��(	�g�z�A�An*


MSE�f?�h+       ��(	��z�A�Ax*


MSE${�>Ki�       ��-	V�z�A�A�*


MSE&�?���       ��-	�6�z�A�A�*


MSE�U�>���       ��-	hv�z�A�A�*


MSEED*?
lG       ��-	1��z�A�A�*


MSE;�>iVF       ��-	s��z�A�A�*


MSE���>�WsJ       ��-	�1�z�A�A�*


MSE\�]?���       ��-	Ql�z�A�A�*


MSED%?��T�       ��-	���z�A�A�*


MSER��>����       ��-	_ѹz�A�A�*


MSE*�9?�u	       ��-	R
�z�A�A�*


MSE��>)��u       ��-	G�z�A�A�*


MSE��>	Ho�       ��-	���z�A�A�*


MSEJU�>���       ��-	��z�A�A�*


MSE�
?r=c�       ��-	��z�A�A�*


MSEl)�>�a�       ��-	�/�z�A�A�*


MSE�O�>2�a       ��-	�i�z�A�A�*


MSE��>��.       ��-	���z�A�A�*


MSE��	?��s       ��-	+ݻz�A�A�*


MSE���>�)�       ��-	��z�A�A�*


MSE�1!?�lE       ��-	�R�z�A�A�*


MSE�R�>��       ��-	?��z�A�A�*


MSE_�>�� �       ��-	�żz�A�A�*


MSE��?n���       ��-	��z�A�A�*


MSE���>W�7        ��-	"8�z�A�A�*


MSE�!?`��       ��-	qq�z�A�A�*


MSE��?�`K       ��-	G��z�A�A�*


MSE��?A�Ʒ       ��-	�z�A�A�*


MSE�0?��$       ��-	��z�A�A�*


MSE��>�=�       ��-	�U�z�A�A�*


MSE�? ��       ��-	_~�z�A�A�*


MSE�{?��v       ��-	���z�A�A�*


MSE��?��(�       ��-	��z�A�A�*


MSE���>hv%"       ��-	,*�z�A�A�*


MSE��?(�S       ��-	�f�z�A�A�*


MSEe�>I�       ��-	,��z�A�A�*


MSE�3?�nZ.       ��-	<ڿz�A�A�*


MSEڻ+?H�P       ��-	s�z�A�A�*


MSE�m=?��/       ��-	�M�z�A�A�*


MSE�w!?�`��       ��-	���z�A�A�*


MSE7��>Wً       ��-	P��z�A�A�*


MSE���>O��       ��-	���z�A�A�*


MSE��?�2�?       ��-	�4�z�A�A�*


MSEI�?]���       ��-	To�z�A�A�*


MSEԪH?�3$	       ��-	P��z�A�A�*


MSE�?�(c�       ��-		��z�A�A�*


MSE.��>��m       ��-	��z�A�A�*


MSE�=?��t       ��-	�R�z�A�A�*


MSEX�?
�#�       ��-	�z�A�A�*


MSEZ�?����       ��-	D��z�A�A�*


MSE���>��ch       ��-	���z�A�A�*


MSE�?u�f       ��-	�&�z�A�A�*


MSE���>�_ff       ��-	�_�z�A�A�*


MSE�(�>,�.+       ��-	o��z�A�A�*


MSE!QE?Q�(}       ��-	���z�A�A�*


MSE)?@.�       ��-	Q�z�A�A�*


MSE���>l��)       ��-	�M�z�A�A�*


MSEq:�>���       ��-	��z�A�A�*


MSE��>2f�.       ��-	*��z�A�A�*


MSE{�>
���       ��-	���z�A�A�*


MSE�ۦ>����       ��-	�7�z�A�A�*


MSE�(?6I~       ��-	�p�z�A�A�*


MSEeӟ>4�J\       ��-	���z�A�A�*


MSE��>[s�L       ��-	)��z�A�A�*


MSE��>��       ��-	b,�z�A�A�*


MSE��=?[��I       ��-	Ii�z�A�A�*


MSE�o�>,��9       ��-	j��z�A�A�*


MSE�2?Z�5�       ��-	��z�A�A�*


MSE�~?	�ˀ       ��-	��z�A�A�*


MSE�~�>�xZ       ��-	�R�z�A�A�*


MSE��4?��       ��-	��z�A�A�*


MSE�Z?�۸�       ��-	���z�A�A�*


MSE.i�>H�y       ��-	 ��z�A�A�*


MSE�N?�-lP       ��-	0*�z�A�A�*


MSEop�>8	�       ��-	�c�z�A�A�*


MSE(x�>BL��       ��-	���z�A�A�*


MSE�>{,�       ��-	g��z�A�A�*


MSEF��>%��        ��-	4�z�A�A�*


MSE�@�>.]�F       ��-	IH�z�A�A�*


MSE�>����       ��-	܄�z�A�A�*


MSE�r?/=OW       ��-	���z�A�A�*


MSE��>��<�       ��-	���z�A�A�*


MSE�l�>	�2�       ��-	�2�z�A�A�*


MSE��4?��ݪ       ��-	�l�z�A�A�*


MSE��?h~y�       ��-	ʥ�z�A�A�*


MSE�}?f�(x       ��-	���z�A�A�*


MSE��?T�fv       ��-	��z�A�A�*


MSE*}�>^��       ��-	�P�z�A�A�*


MSE�&?S@�(       ��-	7��z�A�A�*


MSEc%�>�Y��       ��-	���z�A�A�*


MSE\��>�6�       ��-	���z�A�A�*


MSE�	??��       ��-	�4�z�A�A�*


MSE�?� t�       ��-	�n�z�A�A�*


MSE\��>:�       ��-	��z�A�A�*


MSE��D?c�1�       ��-	c��z�A�A�*


MSEG?"?��3       ��-	�	�z�A�A�*


MSE�y?_�b�       ��-	�B�z�A�A�*


MSE���>���       ��-	W|�z�A�A�*


MSEȆ�>$_�       ��-	̵�z�A�A�*


MSE!�?��k       ��-	���z�A�A�*


MSEf��>/S�I       ��-	^*�z�A�A�*


MSEA�>�}�W       ��-	�b�z�A�A�*


MSE�
?�a*�       ��-	��z�A�A�*


MSE�??�b5v       ��-	,��z�A�A�*


MSE�$?u}��       ��-	�z�A�A�*


MSE�<�>�`       ��-	]O�z�A�A�	*


MSE��>��v       ��-	׊�z�A�A�	*


MSEߞ�>eA�S       ��-		��z�A�A�	*


MSE�
�>2b��       ��-	���z�A�A�	*


MSE�/�>��       ��-	?6�z�A�A�	*


MSE�0?k͐0       ��-	/o�z�A�A�	*


MSE�*?�Ѽ8       ��-	H��z�A�A�	*


MSE��?g�Ҋ       ��-	���z�A�A�	*


MSE�?K(�       ��-	��z�A�A�	*


MSE�5-?J�]       ��-	�D�z�A�A�	*


MSE�(4?t1��       ��-	�|�z�A�A�	*


MSEʥ�>��       ��-	V��z�A�A�	*


MSEd�?����       ��-	|��z�A�A�	*


MSE/��>��l�       ��-	�)�z�A�A�
*


MSEf�&?�j[       ��-	�d�z�A�A�
*


MSE�:?�x�	       ��-	���z�A�A�
*


MSE�F?��:�       ��-	���z�A�A�
*


MSE� ?2M��       ��-	��z�A�A�
*


MSE_ȩ>'���       ��-	CT�z�A�A�
*


MSE?�?7�       ��-	���z�A�A�
*


MSE�S?��       ��-	��z�A�A�
*


MSE��2?h��       ��-	��z�A�A�
*


MSE�?�<�0       ��-	%=�z�A�A�
*


MSE�	?�R�       ��-	Sz�z�A�A�
*


MSER�6?Do�       ��-	��z�A�A�
*


MSE��?F��       ��-	H��z�A�A�
*


MSE] ?��;       ��-	W=�z�A�A�*


MSEmlJ?(jN�       ��-	���z�A�A�*


MSE�g?z_�>       ��-	���z�A�A�*


MSE��G?	F10       ��-	�	�z�A�A�*


MSE$�>|�{}       ��-	�9�z�A�A�*


MSEJ�>�]�#       ��-	�u�z�A�A�*


MSE<�#?1���       ��-	d��z�A�A�*


MSEa=�>�W7       ��-	[��z�A�A�*


MSE#.?�'��       ��-	'�z�A�A�*


MSEZP�>n�g�       ��-	/k�z�A�A�*


MSE���>i({�       ��-	e��z�A�A�*


MSE;��>\��       ��-	���z�A�A�*


MSE�6�>V�'S       ��-	m�z�A�A�*


MSE�z�>'��       ��-	GX�z�A�A�*


MSE�f�>���       ��-	���z�A�A�*


MSEVm=?z[�       ��-	���z�A�A�*


MSE�<
?7K�       ��-	!�z�A�A�*


MSE��>�#�       ��-	h?�z�A�A�*


MSEhQ�>�1�       ��-	�y�z�A�A�*


MSE.
?�	q       ��-	���z�A�A�*


MSE�T�>5��       ��-	F��z�A�A�*


MSEiP?R}       ��-	5)�z�A�A�*


MSE�V?�:�       ��-	kf�z�A�A�*


MSEdc0?���M       ��-	���z�A�A�*


MSE!h!?h ��       ��-	'��z�A�A�*


MSEL?��T�       ��-	-�z�A�A�*


MSEs=�>�hP       ��-	u>�z�A�A�*


MSE,*?jW�       ��-	w�z�A�A�*


MSE=� ?��B�       ��-	���z�A�A�*


MSE&&�>@l�       ��-	h��z�A�A�*


MSEe�?��{       ��-	�"�z�A�A�*


MSEm�!?Y��       ��-	\�z�A�A�*


MSE��>?�o~       ��-	���z�A�A�*


MSE�p?sN       ��-	���z�A�A�*


MSE���>|-�       ��-	��z�A�A�*


MSEn�?��B�       ��-	�@�z�A�A�*


MSE.� ?�f �       ��-	�y�z�A�A�*


MSE��?w"�       ��-	5��z�A�A�*


MSET�?u��       ��-	���z�A�A�*


MSE�D�>#+;       ��-	�(�z�A�A�*


MSEOI?��A�       ��-	�b�z�A�A�*


MSE{�
?���       ��-	9��z�A�A�*


MSE)�>��       ��-	���z�A�A�*


MSE�#�>����       ��-	��z�A�A�*


MSE.��>�&�       ��-	oJ�z�A�A�*


MSE���> ��2       ��-	���z�A�A�*


MSE�<?@��       ��-	��z�A�A�*


MSE(G�>\��       ��-	���z�A�A�*


MSEZ�>�]�       ��-	G!�z�A�A�*


MSE�
?B��       ��-	�]�z�A�A�*


MSE��>��O       ��-	S��z�A�A�*


MSE�X�>��M'       ��-	h��z�A�A�*


MSE�#�>�9��       ��-	�	�z�A�A�*


MSE�?���       ��-	�C�z�A�A�*


MSEܟ�>ꧫr       ��-	J�z�A�A�*


MSE*?�G��       ��-	��z�A�A�*


MSE�,?���N       ��-	���z�A�A�*


MSE�
?=�p�       ��-	�-�z�A�A�*


MSE�0�>r]E�       ��-	j�z�A�A�*


MSE�&?���       ��-	"��z�A�A�*


MSE�y?Nq$�       ��-	L��z�A�A�*


MSE=�>��5       ��-	L�z�A�A�*


MSE͛�>����       ��-	�S�z�A�A�*


MSE�x?/D%       ��-	���z�A�A�*


MSE_|�>$uǡ       ��-	h��z�A�A�*


MSE\%�>��3�       ��-	��z�A�A�*


MSE�%�>�r�       ��-	�?�z�A�A�*


MSEz?rq�`