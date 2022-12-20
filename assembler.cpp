#include <bits/stdc++.h>
using namespace std;

map<string, string>opcode;
map<string, string>funct;
map<string, string>regs;

map<string, int>labelMap;

long long PC=0;

void insertCodes(){

    opcode["add"]="010000";opcode["comp"]="010000";opcode["and"]="010000";opcode["xor"]="010000";opcode["shll"]="010000";
    opcode["shrl"]="010000";opcode["shllv"]="010000";opcode["shrlv"]="010000";opcode["shra"]="010000";opcode["shrav"]="010000";opcode["diff"]="010000";
    
    opcode["lw"]="000000";opcode["sw"]="000001";
    
    opcode["addi"]="110010";opcode["compi"]="110001";

    opcode["b"]="100000";opcode["bl"]="100101";opcode["bcy"]="100110";opcode["bncy"]="100111";

    opcode["br"]="100001";opcode["bltz"]="100010";opcode["bz"]="100011";opcode["bnz"]="100100";

    funct["add"]="000000";funct["comp"]="000001";funct["and"]="000010";funct["xor"]="000011";funct["shll"]="000100";
    funct["shrl"]="000101";funct["shllv"]="000110";funct["shrlv"]="000111";funct["shra"]="001000";funct["shrav"]="001001";funct["diff"]="001010";

    regs["$0"]=regs["$zero"]="00000";
    regs["$1"]=regs["$at"]="00001";
    regs["$2"]=regs["$v0"]="00010";
    regs["$3"]=regs["$v1"]="00011";
    regs["$4"]=regs["$a0"]="00100";
    regs["$5"]=regs["$a1"]="00101";
    regs["$6"]=regs["$a2"]="00110";
    regs["$7"]=regs["$a3"]="00111";
    regs["$8"]=regs["$t0"]="01000";
    regs["$9"]=regs["$t1"]="01001";
    regs["$10"]=regs["$t2"]="01010";
    regs["$11"]=regs["$t3"]="01011";
    regs["$12"]=regs["$t4"]="01100";
    regs["$13"]=regs["$t5"]="01101";
    regs["$14"]=regs["$t6"]="01110";
    regs["$15"]=regs["$t7"]="01111";
    regs["$16"]=regs["$s0"]="10000";
    regs["$17"]=regs["$s1"]="10001";
    regs["$18"]=regs["$s2"]="10010";
    regs["$19"]=regs["$s3"]="10011";
    regs["$20"]=regs["$s4"]="10100";
    regs["$21"]=regs["$s5"]="10101";
    regs["$22"]=regs["$s6"]="10110";
    regs["$23"]=regs["$s7"]="10111";
    regs["$24"]=regs["$t8"]="11000";
    regs["$25"]=regs["$t9"]="11001";
    regs["$26"]=regs["$k0"]="11010";
    regs["$27"]=regs["$k1"]="11011";
    regs["$28"]=regs["$gp"]="11100";
    regs["$29"]=regs["$sp"]="11101";
    regs["$30"]=regs["$fp"]="11110";
    regs["$31"]=regs["$ra"]="11111";

}


void parseLabel(string fileName){

    ifstream inFile;
    inFile.open(fileName);

    long long pc=0;
    for(string line;getline(inFile, line);){

        if(line=="" || line[0]=='#')continue;

        int found=0;
        string label="";

        for(int i=0;i<line.size();++i){
            if(line[i]==':'){
                found=1;
                break;
            }
            label+=line[i];
        }
        if(found){
            labelMap[label]=pc+1;
        }
        else{
            pc+=1;
        }
    }
}


string getCode(string line){

    string code="";
    string op="";

    int opEnd=0;
    for(int i=0;i<line.size();++i){
        if(line[i]==' '){
            opEnd=i;
            break;
        }
        op+=line[i];
    }

    if(opcode[op]=="010000" || op=="addi" || op=="compi"){

        int op2End=opEnd+1;
        string op2="";
        for(int i=opEnd+1;i<line.size();++i){
            if(line[i]==','){
                op2End=i;
                break;
            }
            op2+=line[i];
        }

        int op3End=op2End+1;
        string op3="";

        for(int i=op2End+1;i<line.size();++i){
            if(line[i]=='\n'){
                op3End=i;
                break;
            }
            op3+=line[i];
        }

        code+=opcode[op];
        code+=regs[op2];
        
        if(op=="shll" || op=="shrl" || op=="shra"){
            code+="0000000000";
            const char * op3_const = op3.c_str();
            code+=bitset<5>(atoi(op3_const)).to_string();;
            code+=funct[op];
        }
        else if(op=="addi" || op=="compi"){
            code+="00000";
            const char * op3_const = op3.c_str();
            code+=bitset<16>(atoi(op3_const)).to_string();
        }
        else{
            code+=regs[op3];
            code+="0000000000";
            code+=funct[op];
        }
    }
    else if(op=="lw" || op=="sw"){
        
        int rtEnd=opEnd+1;
        string rt="";

        for(int i=opEnd+1;i<line.size();++i){
            if(line[i]==','){
                rtEnd=i;
                break;
            }
            rt+=line[i];
        }

        string imm="";
        int immEnd=rtEnd+1;

        for(int i=rtEnd+1;i<line.size();++i){
            if(line[i]=='('){
                immEnd=i;
                break;
            }
            imm+=line[i];
        }
        string rs="";
        for(int i=immEnd+1;i<line.size();++i){
            if(line[i]==')')break;
            rs+=line[i];
        }
        code+=opcode[op];
        const char * imm_const = imm.c_str();
        code+=regs[rs];
        code+=regs[rt];
        code+=bitset<16>(atoi(imm_const)).to_string();
    }

    return code;

}

int main(){

    string fileName;
    cin>>fileName;
    insertCodes();
    parseLabel(fileName);
    ifstream inFile;
    inFile.open(fileName);
    ofstream outFile;
    string output = fileName.substr(0,fileName.size()-2)+".coe";
    outFile.open(output);
    outFile<<"memory_initialization_radix=2;"<<'\n';
    outFile<<"memory_initialization_vector="<<'\n';
    outFile<<"11001000000000000000000000000000,\n";

    for(string line;getline(inFile, line);){

        if(line=="" || line[0]=='#')continue;
        string ans;
        string op1="";
        int opend;
        int found=0;
        for(int i=0;i<line.size();++i){
            if(line[i]==':'){
                found=1;
                break;
            }
            if(line[i]==' '){
                opend=i;
                break;
            }
            op1+=line[i];
        }
        if(found)continue;
        if(line[0]=='b'){

            string label="";
            int lblend=0;
            for(int i=line.size()-1;i>=0;--i){
                if(line[i]==',' || line[i]==' '){
                    lblend=i;
                    break;
                }
                label+=line[i];
            }
            reverse(label.begin(),label.end());
            string new_line=line.substr(0,lblend+1);


            ans+=opcode[op1];
            if(op1=="b" || op1=="bl" || op1=="bcy" || op1=="bncy"){
                ans+=(bitset<26>(labelMap[label]).to_string());
            }
            else{
                string rs="";
                for(int i=opend+1;i<line.size();++i){
                    if(line[i]==',')break;
                    rs+=line[i];
                }
                ans+=(bitset<5>(regs[rs]).to_string());
                if(op1=="br"){
                    ans+=bitset<21>(0).to_string();
                }
                else{
                    ans+=(bitset<21>(labelMap[label]).to_string());
                }
            }
        }
        else{
            ans=getCode(line);
        }
        outFile<<ans<<","<<'\n';
    }

    outFile<<"11001000000000000000000000000000;";
    
}
