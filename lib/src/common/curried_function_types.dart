/// {@template curried_function_types.fn}
/// Typedef for a curried function that takes
/// {@endtemplate}
/// 2
/// {@template curried_function_types.args}
/// arguments.
/// {@endtemplate}
typedef CF2<A, B, T> = T Function(B b) Function(A a);

/// {@macro curried_function_types.fn}
/// 3
/// {@macro curried_function_types.args}
typedef CF3<A, B, C, T> = T Function(C c) Function(B b) Function(A a);

/// {@macro curried_function_types.fn}
/// 4
/// {@macro curried_function_types.args}
typedef CF4<A, B, C, D, T> = T Function(D d) Function(C c) Function(B b)
    Function(A a);

/// {@macro curried_function_types.fn}
/// 5
/// {@macro curried_function_types.args}
typedef CF5<A, B, C, D, E, T>
    = T Function(E e) Function(D d) Function(C c) Function(B b) Function(A a);

/// {@macro curried_function_types.fn}
/// 6
/// {@macro curried_function_types.args}
typedef CF6<A, B, C, D, E, F, T>
    = T Function(F f) Function(E e) Function(D d) Function(C c) Function(B b)
        Function(A a);

/// {@macro curried_function_types.fn}
/// 7
/// {@macro curried_function_types.args}
typedef CF7<A, B, C, D, E, F, G, T>
    = T Function(G g) Function(F f) Function(E e) Function(D d) Function(C c)
            Function(B b)
        Function(A a);

/// {@macro curried_function_types.fn}
/// 8
/// {@macro curried_function_types.args}
typedef CF8<A, B, C, D, E, F, G, H, T>
    = T Function(H h) Function(G g) Function(F f) Function(E e) Function(D d)
                Function(C c)
            Function(B b)
        Function(A a);

/// {@macro curried_function_types.fn}
/// 9
/// {@macro curried_function_types.args}
typedef CF9<A, B, C, D, E, F, G, H, I, T>
    = T Function(I i) Function(H h) Function(G g) Function(F f) Function(E e)
                    Function(D d)
                Function(C c)
            Function(B b)
        Function(A a);
