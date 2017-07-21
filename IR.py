#Modelling information as a vector(VECTOR SPACE MODEL)

import os
import numpy

#given a document file reading it

f1=open('doc.txt','r')
doc=f1.readlines()

#text file
f2=['dog','breed','training','pets','guide']

#extracting each lines of the document into seperate list

doc1=[str(doc[i]).lower() for i in range(len(doc))]

#defining document matrix(initializing them to be zero)

my_matrix=numpy.zeros((len(f2),len(doc1)))

#implementing the matrix which matches with the documents

for j in range(len(doc1)):
        for i in range(len(f2)):
                if(f2[i] in doc1[j] or f2[i][:len(f2[i])-1] in doc1[j]):
                        my_matrix[i][j]=1

#normalizing the matrix(orthogonal matrix)

for i in range(len(doc1)):
        my_matrix[:,i]=my_matrix[:,i]/numpy.linalg.norm(my_matrix[:,i])

#taking query terms from the userprint 'Give the query term/terms:'

t=str(raw_input().split()).lower()

#query vector
my_array=numpy.zeros((1,len(f2)))
for i in range(len(f2)):
        if(f2[i] in t ):
                my_array[0][i]=1

print my_array[0]
#finding the angle between the query vector and the document vector,cos,,
#(numpy.linalg.norm-->is for finding the norm)

my_final=numpy.dot(my_array,my_matrix)
temp=numpy.linalg.norm(my_array)
temp1=[temp*numpy.linalg.norm(my_matrix[:,i]) for i in range(len(my_final))]
my_final=[my_final[i]/temp1[i] for i in range(len(my_final))]

#print my_final
#printing the final values which shows relevancy,,the cos theta values

print 'The strength of relevancy of the search options in the given documents:','\n',my_final[0]

#taking cutoff value for reference
print 'Let the cutoff value be 0.5'
k=0.5;

#printing the document with more relevancy
#if max of cos is same as cutoff then printing that no document is more relevant.


#finding the max of the cos values the one with
#more value is relevant..
my_final2=max(my_final[0])
print my_final2
if my_final2>k:
    for i in range(len(doc1)):
        if my_final2==my_final[0][i]:
           print 'document',i+1,'is more relevant to the given query.';
           break
else:      
    print 'none have much relevant information'
   
                        
                                        
                                        
                                        
                                        
