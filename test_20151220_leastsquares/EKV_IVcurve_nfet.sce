// EKVFIT Attempts to fit a simplified EKV model to (VG, ISAT) pairs.
// EKVFIT(VG, ISAT, EPSILON) attempts to fit a simplified EKV model for
// the saturation region of MOS transistor operation to measured values
// of gate voltage (specified in VG) and channel current (specified in
// ISAT).  The assumed form of the model is
//
//    ISAT = Is * (log(1 + exp(kappa*(VG - VT)/(2*0.0258)))).^2
//
// The return values are [Is, VT, kappa].  EKVFIT makes use of LINEFIT.
// First, it attempts to find parameters for the weak-inversion region by
// using LINEFIT on VG and log(ISAT).  Then, it attepts to find
// parameters for the strong-inversion region by using LINEFIT on VG and
// sqrt(ISAT).  It then uses the x-axis intercept from the
// strong-inversion fit as a starting value for VT and computes a
// starting value for IS via cubic-spline interpolation as twice the
// value of ISAT when VG = VT.  EKVFIT then attepts to find a the value
// of IS in the interval between one tenth the initial value of IS and
// ten times the inital value of IS that minimizes the curvature of the
// inverse EKV model applied to ISAT, given by
//
//    log(exp(sqrt(ISAT/Is)) - 1),
//
// when plotted as a function of VG, using the golden-section search.
// Once the best value of Is is found, EKVFIT uses LINEFIT to get the
// slope and intercept of the best-fit line to the EKV model inverse
// expression, given above, applied to ISAT versus VG.  The slope of this
// curve should be kappa/(2*UT) and the VG-axis intercept should be VT.
//
// See the LINEFIT help comment for an explanation of the EPSILON 
// parameter.

function [first, last, mmax, bmax, Nmax]=linefit(x, y, epsilon)
    first=0;
    last=0;
    mmax=0;
    bmax=0;
    Nmax=0;
    
    i=1;
    while i<length(x),
        R2=1;
        N=1;
        sumX=x(i);
        sumX2=x(i)*x(i);
        sumY=y(i);
        sumY2=y(i)*y(i);
        sumXY=x(i)*y(i);
        j=i;
        while (j<length(x)) & (R2>1-epsilon),
            j=j+1;
            N=N+1;
            sumX=sumX+x(j);
            sumX2=sumX2+x(j)*x(j);
            sumY=sumY+y(j);
            sumY2=sumY2+y(j)*y(j);
            sumXY=sumXY+x(j)*y(j);
            SXX=sumX2-sumX*sumX/N;
            SYY=sumY2-sumY*sumY/N;
            SXY=sumXY-sumX*sumY/N;
            m=SXY/SXX;
            b=(sumY-m*sumX)/N;
            R2=SXY*SXY/(SXX*SYY);
        end
//        if ((N>10) & (abs(m)>abs(mmax))),
        if ((N>5) & (abs(m)>abs(mmax))),
            first=i;
            last=j;
            mmax=m;
            bmax=b;
            Nmax=N;
        end
        i=j;
    end
endfunction

function [Is, VT, kappa]=ekvfit_nfet(Vg, Isat, epsilon, plotting)
    
    Is = 0;
    VT = 0;
    kappa = 0;
    
    [WIfirst, WIlast, WIm, WIb, WIN]=linefit(Vg, log(Isat), epsilon);
    if WIN==0
        error('Could not find a weak-inversion region.');
    end
    if plotting == 'on'
        scf(1);clf(1);
        plot2d("nl", Vg, Isat, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
        plot2d("nl", Vg(WIfirst:WIlast), Isat(WIfirst:WIlast), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
        plot2d("nl", Vg, exp(WIm*Vg + WIb), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
        legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_lower_right");
        a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
        xtitle("","Vg(V)","Isat(A)");
        title('Weak-Inversion Fit');
    end
    if min(abs(Isat(WIfirst:WIlast)))>1e-6
        error('Identified a candidate weak-inversion region, but all current levels exceed typical weak-inversion currents.');
    end
    if max(abs(Isat(WIfirst:WIlast)))>1e-6
        warning('Identified a candidate weak-inversion region, but some current levels exceed typical weak-inversion currents.');
    end
    
    [SIfirst, SIlast, SIm, SIb, SIN]=linefit(Vg, sqrt(Isat), epsilon);
    if SIN==0
        error('Could not find a strong-inversion region.');
    end
    scf(2);clf(2);
    plot2d("nn", Vg, sqrt(Isat), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off";
    plot2d("nn", Vg(SIfirst:SIlast), sqrt(Isat(SIfirst:SIlast)), style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
    plot2d("nn", Vg, SIm*Vg + SIb, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
    legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_lower_right");
    a=gca();a.data_bounds=[0 0; 2.5 1e-2];
    xtitle("","Vg(V)","Isat(A)");
    title('Strong-Inversion Fit');
    if max(abs(Isat(SIfirst:SIlast)))<0.1e-6
        error('Identified a candidate strong-inversion region, but all current levels are lower than typical strong-inversion currents.');
    end
    if min(abs(Isat(SIfirst:SIlast)))<0.1e-6
        warning('Identified a candidate strong-inversion region, but some current levels are lower than typical strong-inversion currents.');
    end

    if SIfirst>WIlast
        first = WIfirst;
        last = SIlast;
    elseif WIfirst>SIlast
        first = SIfirst;
        last = WIlast;
    else
        error('Weak-inversion and strong-inversion regions found were not disjoint.');
    end
    
    VT=-SIb/SIm; 
    //Is=2*spline(Vg(first:last), Isat(first:last), VT);
    splin_Is=2*splin(Vg(first:last), Isat(first:last));
    Is=interp(VT,Vg(first:last), Isat(first:last),splin_Is);

    R=0.61803399;
    C=1.-R;
    tol=1e-4;

    x0=0.1*Is;
    x1=Is;
    x2=(1.+9.*C)*Is;
    x3=10.*Is;
    dVg=diff(Vg(first:last));
    
    temp=diff(log(exp(sqrt(Isat(first:last)/x1))-1))./dVg;
    f1=stdev(temp)/mean(temp);
    temp=diff(log(exp(sqrt(Isat(first:last)/x2))-1))./dVg;
    f2=stdev(temp)/mean(temp);
    
    while abs(x3-x0)>tol*(abs(x1)+abs(x2)),
        if f2<f1,
            x0=x1; x1=x2; x2=R*x1+C*x3;
            f1=f2;
            temp=diff(log(exp(sqrt(Isat(first:last)/x2))-1))./dVg;
            f2=stdev(temp)/mean(temp);
            if plotting == 'on'
                [EKVfirst, EKVlast, m, b, N]=linefit(Vg(first:last), log(exp(sqrt(Isat(first:last)/x2))-1), epsilon);
//                scf(3);clf(3);
//                plot2d("nl", Vg(first:last), exp(sqrt(Isat(first:last)/x2))-1, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//                plot2d("nl", Vg(first:last), exp(m*Vg(first:last)+b), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//                legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_lower_right");
//                xtitle("","Vg(V)","Isat(A)");
//                title(['Optimizing Specific Current: I_s = ', string(x2), 'A']);
            end
        else
            x3=x2; x2=x1; x1=R*x2+C*x0;
            f2=f1;
            temp=diff(log(exp(sqrt(Isat(first:last)/x1))-1))./dVg;
            f1=stdev(temp)/mean(temp);
            if plotting == 'on'
                [EKVfirst, EKVlast, m, b, N]=linefit(Vg(first:last), log(exp(sqrt(Isat(first:last)./x1))-1), epsilon);
//                scf(4);clf(4);
//                plot2d("nl",Vg(first:last), exp(sqrt(Isat(first:last)/x1))-1, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
//                plot2d("nl", Vg(first:last), exp(m*Vg(first:last)+b), style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//                legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_lower_right");
//                xtitle("","Vg(V)","Isat(A)");
//                title(['Optimizing Specific Current: I_s = ', string(x1), 'A']);
            end
        end
    end

    if f1<f2,
        Is=x1;
    else
        Is=x2;
    end
    [EKVfirst, EKVlast, m, b, N]=linefit(Vg(first:last), log(exp(sqrt(Isat(first:last)./Is))-1), epsilon);
    VT=-b/m;
    kappa=2*m*0.0258;
    if plotting == 'on'
        scf(5);clf(5);
        plot2d("nl",Vg, Isat, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off"; 
        plot2d("nl",Vg(WIfirst:WIlast), Isat(WIfirst:WIlast), style=2);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
        plot2d("nl",Vg(SIfirst:SIlast), Isat(SIfirst:SIlast), style=2);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
        c=log(1+exp(kappa*(Vg-VT)/(2*0.0258))).^2;
        plot2d("nl", Vg, Is*(log(1+exp(kappa*(Vg-VT)/(2*0.0258)))).^2, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
        legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_lower_right");
        a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
        xtitle("","Vg(V)","Isat(A)");
        title(['EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa)]);
        scf(6);clf(6);
        plot2d("nn",Vg, Isat, style=1);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 1; p.children.line_mode="off"; 
        plot2d("nn",Vg(WIfirst:WIlast), Isat(WIfirst:WIlast), style=2);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
        plot2d("nn",Vg(SIfirst:SIlast), Isat(SIfirst:SIlast), style=2);p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";
        c=log(1+exp(kappa*(Vg-VT)/(2*0.0258))).^2;
        plot2d("nn", Vg, Is*(log(1+exp(kappa*(Vg-VT)/(2*0.0258)))).^2, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
        legend(" Data1","Polynomial Model1","Data2","Polynomial Model2","in_lower_right");
        //a=gca();a.data_bounds=[0 1e-10; 2.5 1e-3];
        xtitle("","Vg(V)","Isat(A)");
        title(['EKV Fit: I_s = '+string(Is)+'A, V_T = '+string(VT)+'V, Kappa = '+string(kappa)]);
    end
endfunction

nfet_iv=csvRead("./data_nFET_IVg_curve");
epsilon=0.005;
plotting="on";
[Is, VT, kappa]=ekvfit_nfet(nfet_iv(:,1), nfet_iv(:,2), epsilon, plotting)


