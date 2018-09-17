<#import "parts/common.ftl" as c>
<#import "parts/forms.ftl" as l>

<@c.page>
    <h5>${username}</h5>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Name:</label>
            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" placeholder="Name" value="${name!''}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Surname:</label>
            <div class="col-sm-6">
                <input type="text" name="surname" class="form-control" placeholder="Surname" value="${surname!''}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Update</button>
    </form>
</@c.page>
