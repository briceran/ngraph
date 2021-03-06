.. softmax.rst:

#######
Softmax
#######

.. code-block:: cpp

   Softmax  // Softmax operation


Description
===========

Produces a tensor of the same element type and shape as ``arg``,
where the value at each coordinate of ``output`` is the expine of the
value of the corresponding coordinate of ``arg`` divided by the sum
of the expine of all coordinates of ``arg`` in the specified ``axes``.

Inputs
------

+-----------------+-------------------------+--------------------------------+
| Name            | Element Type            | Shape                          |
+=================+=========================+================================+
| ``arg``         | Any                     | Any                            |
+-----------------+-------------------------+--------------------------------+

Parameters
----------
+-----------------+----------------------------------------------------------------+
| Name            | Description                                                    |
+=================+================================================================+
| ``axes``        | The axis positions (0-based) on which to calculate the softmax |
+-----------------+----------------------------------------------------------------+

Outputs
-------

+-----------------+-------------------------+--------------------------------+
| Name            | Element Type            | Shape                          |
+=================+=========================+================================+
| ``output``      | Same as ``arg``         | Same as ``arg``                |
+-----------------+-------------------------+--------------------------------+


Mathematical Definition
=======================

.. math::

   \texttt{output}_{i} = \frac{\exp(\texttt{arg}_{i})}{\sum_{j} \exp(\texttt{arg}_{j})}


C++ Interface
=============

.. doxygenclass:: ngraph::op::Softmax
   :project: ngraph
   :members: m_axes