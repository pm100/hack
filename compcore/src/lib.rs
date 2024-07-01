mod constants;
pub mod assembler {
    pub mod assembler;
}
pub mod jcomp {
    pub mod compiler;
    pub mod expression;
    pub mod symbols;
}

pub mod vcomp {
    //pub mod constants;
    pub mod vmcomp;
}

pub mod linker {
    pub mod linker;
}
