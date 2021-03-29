library(DiagrammeR)
library(DiagrammeRsvg)
t<-DiagrammeR::grViz("digraph {

graph [layout = dot, rankdir = TB]

# define the global styles of the nodes. We can override these in box if we wish
node [shape = rectangle, style = filled, fillcolor = Linen]

data1 [label = 'Baseline Data', shape = folder, fillcolor = Turquoise]
a1 [label =  'Households \n n = 2994\nIndividuals \n n = 5313', fillcolor = Turquoise]

a6 [label = 'Individuals \n n = 869']
a7 [label = 'Individuals \n n = 4444']
a8 [label = 'Intermediate DBS result &\nNo Blood Plasma result\n n = 11']

a9 [label = 'Households \n n = 2564\nIndividuals \n n = 4433']

a11 [label = 'Households \n n = 2139\nIndividuals \n n = 3400']


a13 [label = 'Households \n n = 2139\nIndividuals \n n = 3399']

data3 [label = 'Matched Data \n Baseline + Round 2', shape = folder, fillcolor = Beige]

data4 [label = 'Serology Analysis Data \n Baseline + Round 2\nNew positives | Baseline Results', shape = folder, fillcolor = Beige]
 
data5 [label = 'Combined Data\n Baseline or Round 2\nEver Positive vs Never Positive', shape = folder, fillcolor = Beige]

data6 [label = 'Leisure Data\n Baseline or Round 2\nEver Positive vs Never Positive', shape = folder, fillcolor = Beige]
data7 [label = 'Risk behavior Data\n Baseline or Round 2\nEver Positive vs Never Positive', shape = folder, fillcolor = Beige]

# edge definitions with the node IDs
data1-> a1 ;


a1 -> data5;
data5 -> data7[label='Risk behavior\nquestions\ncompleted'];
data5 -> data6[xlabel='Leisuretime\nquestions\ncompleted'];

data6->a11;
data7->a13;
data5 -> data3[label='Round 2 DBS/Blood\npresent'];


a1 ->a6[label='Round 2 DBS/Blood\nmissing'];

data3 ->a7;

a7 -> a8[label='Intermediate\nresults excluded'];
a7 -> data4;

data4 -> a9 ;

{rank = same; a7; a8;}
{rank = same; a6; a1;}
                     
{rank = same; data5;data3; }
{rank = same; data6; data7; data4}
}")
t
svg <- export_svg(t)
library(htmltools)
html_print(HTML(svg))
